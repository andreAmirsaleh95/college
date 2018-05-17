using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class truckController : MonoBehaviour {

    public float forceDenominator;
    public float speedOnKill;

    private List<Transform> wheels;
    private Rigidbody2D rb;
    private bool isPlayerInTruck;
    private playerController player;
    private gameController gameController;
    private float wheelRadius;

	void Awake () {

        rb = GetComponent<Rigidbody2D>();
        player = GameObject.FindGameObjectWithTag("Player").GetComponent<playerController>();
        gameController = GameObject.FindGameObjectWithTag("GameController").GetComponent<gameController>();
        wheels = new List<Transform>();
        wheelRadius = transform.GetChild(0).GetComponent<SpriteRenderer>().bounds.size.x;

		foreach (Transform child in transform)
        {
            wheels.Add(child);
        }

	}
	
	void Update () {

        rotateWheels();

        if (player.transform.position.x - transform.position.x > 40)
        {
            this.gameObject.SetActive(false);
            gameController.decrementNumberActiveEnemies();
            if (this.gameObject.tag == "Truck")
            {
                gameController.setIsTruckOnScreen(false);
            }
        }

    }

    public void rotateWheels()
    {
        float velocityMagnitude = rb.velocity.magnitude;
        float rot = ((velocityMagnitude * Time.deltaTime) / wheelRadius) * Mathf.Rad2Deg;
        foreach (Transform wheel in wheels)
        {
            wheel.Rotate(0, 0, -rot);
        }
    }

    public void OnTriggerEnter2D(Collider2D collision)
    {
        if (collision.GetComponent<enemyController>() != null && player.getIsInTruck())
        {
            player.killEnemy(collision.gameObject, 10, 100);
        }
    }

    public void setVelocity(float xVelocity, float yVelocity)
    {
        rb.velocity = new Vector2(xVelocity, yVelocity);
    }
}
