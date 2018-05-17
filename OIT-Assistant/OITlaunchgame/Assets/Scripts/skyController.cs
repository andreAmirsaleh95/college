using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class skyController : MonoBehaviour {

    public GameObject sky;
    public playerController player;

    private float verticalLength;
    private float horizontalLength;
    private bool isPlayerInSky;

    void Start () {
        verticalLength = findHeight();
        horizontalLength = findWidth();
        Debug.Log("vertical length = " + verticalLength);
        Debug.Log("horizontal length = " + horizontalLength);
    }
	

	void Update () {
		
        if (player.transform.position.y > verticalLength)
        {
            isPlayerInSky = true;
        }

        if (isPlayerInSky)
        {
            generateSky();
        }
	}

    public float findHeight()
    {
        float ret = 0;

        foreach (Transform child in sky.transform)
        {
            ret += child.gameObject.GetComponent<SpriteRenderer>().bounds.size.y;
        }
        return ret;
    }

    public float findWidth()
    {
        return sky.transform.GetChild(0).GetComponent<SpriteRenderer>().bounds.size.x;
    }

    public void generateSky()
    {
        //Instantiate(sky, new Vector2(player.transform.position.x, player.transform.position.y + (0.25f * verticalLength)), );
    }
}
