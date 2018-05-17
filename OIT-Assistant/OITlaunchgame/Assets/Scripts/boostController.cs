using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class boostController : MonoBehaviour {

    public playerController player;

    //private List<Slider> boosts;
    private Slider boostSlider;
    //private int rechargeIndex = 0;
    //private int useIndex = 0;

	void Start () {
        boostSlider = GetComponentInChildren<Slider>();
        
	}
	
	void Update () {
		
	}
}
