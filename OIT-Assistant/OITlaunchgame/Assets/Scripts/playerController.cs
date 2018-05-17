using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class playerController : MonoBehaviour {

    public catapultController catapult;
    public float boostForce;
    public gameController gameController;
    public Text boostText;
    public Text scoreText;
    public Slider boostSlider;

    private upgradeManager upgradeManager;
    private Rigidbody2D rb;
    private BoxCollider2D hitCollider;
    private AudioSource audio;
    private Animator anim;
    private Transform childSprite;
    private Vector3 positionInTruck = new Vector3(-1.04f, 0.84f, 0);
    private List<GameObject> enemiesToBeKilled;
    private GameObject currentPowerUp;
    private bool isBoosting;
    private bool isCollidingWithEnemy;
    private bool isCollidingWithGround;
    private bool isInTruck;
    private int maxBoosts;
    private int boostRegen;
    private int numBoosts;
    private float enemySpeedReduction;// = .8f;
    private float groundSpeedReduction;// = 2;
    private float groundForce;
    private float collisionForce;
    private float normalColliderWidth;
    private float boostColliderWidth;
    private float truckLength = 4f;
    private float truckTime;
    private float truckSpeedBonus = 5f;


    void Start () {
        upgradeManager = GameObject.FindGameObjectWithTag("UpgradeManager").GetComponent<upgradeManager>();
        rb = GetComponent<Rigidbody2D>();
        hitCollider = GetComponent<BoxCollider2D>();
        audio = GetComponent<AudioSource>();
        childSprite = transform.GetChild(0);
        anim = childSprite.GetComponent<Animator>();
        maxBoosts = upgradeManager.maxBoosts;
        enemySpeedReduction = upgradeManager.enemySpeedReduction;
        groundSpeedReduction = upgradeManager.groundSpeedReduction;
        boostText.text = "" + maxBoosts;
        boostRegen = 0;
        numBoosts = maxBoosts;
        normalColliderWidth = hitCollider.bounds.size.x / transform.localScale.x;
        boostColliderWidth = normalColliderWidth * 1.3f;
        enemiesToBeKilled = new List<GameObject>();
    }
	
	void FixedUpdate () {

        scoreText.text = upgradeManager.getPlayerScore().ToString();

        if (rb.velocity.x < 0 || (rb.velocity.y < 0 && isCollidingWithGround))
        {
            gameController.gameOver();
        }

        if (isInTruck)
        {
            if (Time.time > truckTime && isInTruck)
            {
                leaveTruck();
            }
        }
        else
        {
            groundForce = rb.velocity.x / 46f;
            float zAngle = Mathf.Atan2(rb.velocity.y, rb.velocity.x) * Mathf.Rad2Deg;
            childSprite.transform.eulerAngles = new Vector3(transform.rotation.x, transform.rotation.y, zAngle);
            /*
            if (Input.GetKeyDown(KeyCode.B) && catapult.getIsShot() && numBoosts > 0 && !isBoosting && !isCollidingWithGround)
            {
                boost();
            }
            */
            
            if (Input.touchCount == 1 && catapult.getIsShot() && numBoosts > 0 && !isBoosting && !isCollidingWithGround)
            {
                if (Input.GetTouch(0).phase == TouchPhase.Began)
                {
                    boost();
                }
            }
            
        }
	}

    public Vector2 getSpeed()
    {
        return rb.velocity;
    }

    public void boost()
    {
        setIsBoosting(true);
        rb.velocity = new Vector2(rb.velocity.x, 0);
        rb.AddForce(new Vector2(0, -boostForce), ForceMode2D.Impulse);
        numBoosts--;
        boostText.text = "" + numBoosts;
    }

    public void hitGround()
    {
        audio.Play();
        if (rb.velocity.x < groundSpeedReduction && !isBoosting)
        {
            gameController.gameOver();
        }
        else
        {
            Vector2 temp = rb.velocity;
            temp = Vector2.Reflect(temp, Vector2.up);
            rb.velocity = Vector2.zero;
            rb.AddForce(temp * groundForce, ForceMode2D.Impulse);
            if (isBoosting)
            {
                if (rb.velocity.x <= groundSpeedReduction + 1)
                {
                    rb.velocity = new Vector2(temp.x, rb.velocity.y);
                }
                setIsBoosting(false);
            }
            rb.velocity = new Vector2(temp.x - groundSpeedReduction, rb.velocity.y);
        }
    }

    public void OnTriggerEnter2D(Collider2D collision)
    {
        if (collision.tag == "Truck")
        {
            hitTruck(collision.gameObject);
        }

        if ((collision.tag == "Enemy" || collision.tag == "EnemyBomb") && !collision.GetComponent<enemyController>().getIsDead() && !isCollidingWithEnemy)
        {
            isCollidingWithEnemy = true;
            bool wasBoostingOnCollision = false;
            Vector2 temp = rb.velocity;
            if (rb.velocity.y < 0)
            {
                temp = Vector2.Reflect(temp, Vector2.up);
            }
            if (isBoosting)
            {
                wasBoostingOnCollision = true;
                getEnemiesInRange();
                setIsBoosting(false);
            }
            else
            {
                if (!collision.GetComponent<enemyController>().isSpecial)
                {
                    temp.x -= enemySpeedReduction;
                }
                else
                {
                    temp.x += collision.GetComponent<enemyController>().speedBonus;
                }
            }
            collisionForce = temp.x / collision.GetComponent<enemyController>().boostForceDenominator;
            collisionForce = Mathf.Clamp(collisionForce, .4f, .7f);
            rb.velocity = Vector2.zero;
            rb.AddForce(temp * collisionForce, ForceMode2D.Impulse);
            rb.velocity = new Vector2(temp.x, rb.velocity.y);
            if (wasBoostingOnCollision)
            {
                foreach (GameObject enemy in enemiesToBeKilled)
                {
                    killEnemy(enemy, 5, 20);
                }
                enemiesToBeKilled.Clear();
            }
            else
            {
                killEnemy(collision.gameObject, 5, 20);
            }
            isCollidingWithEnemy = false;
        }
    }

    public void getEnemiesInRange()
    {
        foreach (GameObject enemy in gameController.getActiveEnemies())
        {
            if (Vector2.Distance(this.transform.position, enemy.transform.position) <= hitCollider.size.x)
            {
                enemiesToBeKilled.Add(enemy);
            }
        }
    }

    public void hitTruck(GameObject truck)
    {
        currentPowerUp = truck;
        truckTime = Time.time + truckLength;
        float xVelocity = rb.velocity.x;
        setIsInTruck(true);
        this.transform.parent = truck.transform;
        this.transform.localPosition = positionInTruck;
        this.rb.velocity = Vector2.zero;
        rb.constraints = RigidbodyConstraints2D.FreezePositionY;
        setAnimator(false);
        childSprite.eulerAngles = Vector3.zero;
        rb.velocity = new Vector2(xVelocity, 0);
        truck.GetComponent<truckController>().setVelocity(xVelocity, 0);
    }

    public void leaveTruck()
    {
        setIsInTruck(false);
        this.transform.parent = null;
        rb.constraints = RigidbodyConstraints2D.None;
        setAnimator(true);
        currentPowerUp.GetComponent<truckController>().setVelocity(0, 0);
        Vector2 temp = new Vector2(rb.velocity.x + truckSpeedBonus, rb.velocity.x);
        collisionForce = rb.velocity.x / currentPowerUp.GetComponent<truckController>().forceDenominator;
        rb.velocity = Vector2.zero;
        rb.AddForce(temp * collisionForce, ForceMode2D.Impulse);
        rb.velocity = new Vector2(temp.x, rb.velocity.y);
    }

    public void killEnemy(GameObject enemy, int pointValue, int boostValue)
    {
        StartCoroutine(enemy.GetComponent<enemyController>().die());
        regenBoost(boostValue);
        //add point value to score
    }

    public void regenBoost(int boostValue)
    {
        if (numBoosts < maxBoosts)
        {
            boostRegen += boostValue;

            if (boostRegen >= 100)
            {
                numBoosts += 1;
                boostRegen = 0;
                boostText.text = "" + numBoosts;
            }
            boostSlider.value = boostRegen;
        }
    }

    public void setIsBoosting(bool b)
    {
        this.isBoosting = b;
        if (b == true)
        {
            hitCollider.size = new Vector2(boostColliderWidth, hitCollider.size.y);
        }
    }

    public bool getIsBoosting()
    {
        return this.isBoosting;
    }

    public int getNumBoosts()
    {
        return this.numBoosts;
    }

    public void setNumBoosts(int n)
    {
        this.numBoosts = n;
    }

    public float getEnemySpeedReduction()
    {
        return this.enemySpeedReduction;
    }

    public void setIsCollidingWithGround(bool b)
    {
        this.isCollidingWithGround = b;
    }

    public bool getIsInTruck()
    {
        return this.isInTruck;
    }

    public void setIsInTruck(bool b)
    {
        isInTruck = b;
    }

    public void setAnimator(bool b)
    {
        anim.SetBool("isFlying", b);
    }
}
