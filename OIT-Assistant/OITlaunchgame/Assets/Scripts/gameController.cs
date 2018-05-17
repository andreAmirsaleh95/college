using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class gameController : MonoBehaviour {

    public GameObject player;
    public repeatBackground background1;
    public repeatBackground background2;
    public GameObject normalEnemy;
    public GameObject bombEnemy;
    public GameObject truck;
    public gameOverMenuController gameOverMenuController;
    public int maxEnemies;

    //private int playerScore;  Maybe handle in upgrade manager b/c it's in there already
    private upgradeManager upgradeManager;
    private int numActiveEnemies;
    private bool isBombOnScreen;
    private bool isTruckOnScreen;
    private bool isGameOver;
    private List<GameObject> enemies;
    private List<GameObject> activeEnemies;
    private float spawnOffset;
    private const int ySpawnPos = -1;
    private const float velocityMax = 8f;
    private float truckFrequency;
    private float bombEnemyFrequency;
    private string distanceStr;

	void Start () {
        upgradeManager = GameObject.FindGameObjectWithTag("UpgradeManager").GetComponent<upgradeManager>();
        enemies = new List<GameObject>();
        activeEnemies = new List<GameObject>();
        for (int i = 0; i <= maxEnemies; i++)
        {
            GameObject enemy = Instantiate(normalEnemy);
            enemy.SetActive(false);
            enemies.Add(enemy);
        }
        spawnOffset = background1.getHorizontalLength();
        numActiveEnemies = 0;
        truckFrequency = upgradeManager.truckFrequency;
        bombEnemyFrequency = upgradeManager.bombEnemyFrequency;
    }
	
	void Update () {

        if (numActiveEnemies < maxEnemies)
        {
            spawn();
        }

	}

    public void gameOver()
    {
        player.GetComponent<Rigidbody2D>().velocity = Vector2.zero;
        player.GetComponent<Rigidbody2D>().constraints = RigidbodyConstraints2D.FreezePosition;
        player.GetComponent<BoxCollider2D>().enabled = false;
        calculateDistance();
        gameOverMenuController.setIsGameOver(true);
        //gameOverMenuController.enabled = true;
        //player.enabled = false;
        //Game over menu 

    } 

    public void spawn()
    {
        float randPosition = Random.Range(getBackgroundStart(), getBackgroundEnd());
        float randType = Random.Range(0f, 1f);
        float randVelocity = Random.Range(1f, velocityMax);
        GameObject enemy;
        if (randType < bombEnemyFrequency && !isBombOnScreen)
        {
            enemy = Instantiate(bombEnemy, new Vector3(randPosition, ySpawnPos, 0), Quaternion.identity);
            enemy.GetComponent<enemyController>().setVelocity(randVelocity);
            activeEnemies.Add(enemy);
            isBombOnScreen = true;
        }
        else if (randType >= bombEnemyFrequency && randType < bombEnemyFrequency + truckFrequency && !isTruckOnScreen)
        {
            enemy = Instantiate(truck, new Vector3(randPosition, 0, 0), Quaternion.identity);
            enemy.GetComponent<truckController>().setVelocity(randVelocity, 0);
            isTruckOnScreen = true;
        }
        else
        {
            enemy = getEnemy();
            enemy.transform.position = new Vector3(randPosition, ySpawnPos, 0);
            enemy.SetActive(true);
            activeEnemies.Add(enemy);
            enemy.GetComponent<enemyController>().setVelocity(randVelocity);
            enemy.GetComponent<enemyController>().setIsDead(false);
        }
        numActiveEnemies += 1;
    }

    public GameObject getEnemy()
    {
        for (int i= 0; i < enemies.Count; i++)
        {
            if (!enemies[i].activeInHierarchy)
            {
                return enemies[i];
            }
        }
        return null;
    }

    public void calculateDistance()
    {
        float distance = player.transform.position.x + 9.2f;
        //Debug.Log("distance = " + distance);
        //Debug.Log("curr high score = " + highScore);
        if (distance > upgradeManager.highScore)
        {
            upgradeManager.highScore = distance; //push to back end
            distanceStr = "Distance : " + distance + "\nNew High Score!";
        }
        else
        {
            distanceStr = "Distance: " + distance;
        }
    }

    public string getDistanceStr()
    {
        return this.distanceStr;
    }

    public void decrementNumberActiveEnemies()
    {
        numActiveEnemies -= 1;
    }

    public float getBackgroundEnd()
    {
        int count = Mathf.Max(background1.getCount(), background2.getCount());
        return count * spawnOffset + spawnOffset;
    }

    public float getBackgroundStart()
    {
        int count = Mathf.Max(background1.getCount(), background2.getCount());
        return count * spawnOffset;
    }

    public void setIsBombOnScreen(bool b)
    {
        isBombOnScreen = b;
    }

    public bool getIsBombOnScreen()
    {
        return isBombOnScreen;
    }

    public void setIsTruckOnScreen(bool b)
    {
        isTruckOnScreen = b;
    }

    public List<GameObject> getEnemies()
    {
        return enemies;
    }

    public List<GameObject> getActiveEnemies()
    {
        return activeEnemies;
    }
}
