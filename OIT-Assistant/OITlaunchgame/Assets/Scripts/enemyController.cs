using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class enemyController : MonoBehaviour {

    public int boostPoints;
    public int pointValue;
    public bool isSpecial;
    public float speedBonus;
    public float yVelocityPenalty;
    public float boostForceDenominator;
    public Sprite[] explosions;

    private upgradeManager upgradeManager;
    private Rigidbody2D rb;
    private SpriteRenderer render;
    private Sprite enemySprite;
    private Vector3 maxScale;
    private bool isDead;
    private float deathTime = .4f;
    private Transform player;
    private gameController gameController;


	void OnEnable () {
        upgradeManager = GameObject.FindGameObjectWithTag("UpgradeManager").GetComponent<upgradeManager>();
        rb = GetComponent<Rigidbody2D>();
        player = GameObject.FindGameObjectWithTag("Player").transform;
        gameController = GameObject.FindGameObjectWithTag("GameController").GetComponent<gameController>();
        render = GetComponent<SpriteRenderer>();
        enemySprite = render.sprite;
        maxScale = transform.localScale;
        isDead = false;
    }
	
	void Update () {

        if (isDead)
        {
            float t = Time.deltaTime / deathTime;
            transform.localScale = Vector3.MoveTowards(transform.localScale, maxScale, t);
        }

        if (player.position.x - transform.position.x > 40)
        {
            this.gameObject.SetActive(false);
            gameController.getActiveEnemies().Remove(this.gameObject);
            if (!isSpecial)
            {
                gameController.decrementNumberActiveEnemies();
            }
            else
            {
                killSpecial();
            }
        }
	}

    public IEnumerator die()
    {
        upgradeManager.setPlayerScore(upgradeManager.getPlayerScore() + pointValue);
        Sprite explosion = explosions[Random.Range(0, explosions.Length)];
        transform.localScale = Vector3.zero;
        render.sprite = explosion;
        isDead = true;
        yield return new WaitForSeconds(.27f);
        gameController.getActiveEnemies().Remove(this.gameObject);
        if (!isSpecial)
        {
            render.sprite = enemySprite;
            this.gameObject.SetActive(false);
            gameController.decrementNumberActiveEnemies();
        }
        else
        {
            killSpecial();
        }
    }

    public void setVelocity(float x)
    {
        rb.velocity = new Vector2(x, 0);
    }

    public bool getIsDead()
    {
        return this.isDead;
    }

    public void setIsDead(bool b)
    {
        this.isDead = b;
    }

    public float getYVelocityPenalty()
    {
        return this.yVelocityPenalty;
    }

    public void killSpecial()
    {
        if (this.gameObject.tag == "EnemyBomb")
        {
            gameController.setIsBombOnScreen(false);
            Destroy(this.gameObject);
        }
    }
}
