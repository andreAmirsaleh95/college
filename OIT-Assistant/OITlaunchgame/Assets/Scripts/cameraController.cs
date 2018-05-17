using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class cameraController : MonoBehaviour {

    public Transform player;
    public catapultController catapult;

    private const int distance = -10;
    private Vector3 startPos = new Vector3(-2, .5f, distance);

	void Start () {
        transform.position = startPos;
	}
	
	// Update is called once per frame
	void Update () {

        if (catapult.getIsShot())
        {
            transform.position = new Vector3(player.position.x, player.position.y + distance / 5.5f, player.position.z + distance);
            transform.position = new Vector3(transform.position.x, Mathf.Clamp(transform.position.y, startPos.y, Mathf.Infinity), transform.position.z);
        }

	}
}
