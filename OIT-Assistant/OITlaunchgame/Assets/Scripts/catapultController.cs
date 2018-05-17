using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class catapultController : MonoBehaviour {

    public float minForce;
    //public float maxForce; // make private, get from upgradeManager
    public Rigidbody2D player;
    public Slider forceSlider;

    private upgradeManager upgradeManager;
    private float maxForce;
    private float meterTime;
    private float targetForce;
    private float shotForce;
    private bool isShot = false;
    private AudioSource audio;
    
	void Start () {
        upgradeManager = GameObject.FindGameObjectWithTag("UpgradeManager").GetComponent<upgradeManager>();
        maxForce = upgradeManager.launchForce;
        targetForce = maxForce;
        shotForce = minForce;
        forceSlider.minValue = minForce;
        forceSlider.maxValue = maxForce;
        meterTime = maxForce * .9f;
        audio = GetComponent<AudioSource>();
	}
	
	void Update () {
        /*
        if (Input.GetKeyDown(KeyCode.Space) && !isShot)
        {
            player.constraints = RigidbodyConstraints2D.None;
            isShot = true;
            shoot();
        }
        */
        
        if (Input.touchCount == 1 && !isShot)
        {
            if (Input.GetTouch(0).phase == TouchPhase.Began)
            {
                player.constraints = RigidbodyConstraints2D.None;
                isShot = true;
                shoot();
            }
        }

        lerpShotForce();
	}

    public void lerpShotForce()
    {
        if (shotForce == maxForce)
        {
            targetForce = minForce;
        }

        else if (shotForce == minForce)
        {
            targetForce = maxForce;
        }

        shotForce = Mathf.MoveTowards(shotForce, targetForce, Time.deltaTime * meterTime);
        forceSlider.value = shotForce;
    }

    public void shoot()
    {
        audio.Play();
        player.constraints = RigidbodyConstraints2D.None;
        player.AddRelativeForce(new Vector2(1,1) * shotForce, ForceMode2D.Impulse);
        forceSlider.gameObject.SetActive(false);
        player.freezeRotation = true;
        player.GetComponent<playerController>().setAnimator(true);
    }

    public bool getIsShot()
    {
        return isShot;
    }
}
