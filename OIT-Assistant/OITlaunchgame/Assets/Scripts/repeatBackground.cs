using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class repeatBackground : MonoBehaviour {

    public playerController player;
    public int count;

    private float horizontalLength;
    private float backgroundEnd;
    private const float yPos = -1.48f;

	void Awake () {
        horizontalLength = GetComponent<SpriteRenderer>().bounds.size.x;
        transform.position = new Vector2(count * horizontalLength + 0.06f, yPos);
	}
	

	void Update () {

        if ((player.transform.position.x) > ((count * horizontalLength) + (horizontalLength * .75)))
        {
            reposition();
        }
	}

    public void reposition()
    {
        count += 2;
        transform.position = new Vector2(count * horizontalLength, yPos);
    }

    public void OnTriggerEnter2D(Collider2D collision)
    {
        if (collision.gameObject.tag == "Player" && player.catapult.getIsShot() && collision.gameObject.GetComponent<Rigidbody2D>().velocity.y < 0) 
        {
            player.setIsCollidingWithGround(true);
            player.hitGround();
        }
    }

    public void OnTriggerExit2D(Collider2D collision)
    {
        if (collision.gameObject.tag == "Player")
        {
            player.setIsCollidingWithGround(false);
        }
    }

    public int getCount()
    {
        return this.count;
    }

    public float getHorizontalLength()
    {
        return this.horizontalLength;
    }
}
