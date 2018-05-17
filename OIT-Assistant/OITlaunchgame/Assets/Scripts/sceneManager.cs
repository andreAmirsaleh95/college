using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class sceneManager : MonoBehaviour {

    static sceneManager instance;

	// Use this for initialization
	void Start () {
		
        if (instance != null)
        {
            GameObject.Destroy(gameObject);
        }
        else
        {
            GameObject.DontDestroyOnLoad(gameObject);
            instance = this;
        }

	}
	
	// Update is called once per frame
	void Update () {
		
	}

    public void startGame()
    {
        SceneManager.LoadScene("mainScene");
    }

    public void goToStore()
    {
        SceneManager.LoadScene("store");
    }

    public void quitGame()
    {
        if (SceneManager.GetActiveScene().name == "mainScene")
        {
            SceneManager.LoadScene("mainMenu");
        }
        else
        {
            //IonicComms.FinishActivity();
            Application.Quit();
        }
    }
}
