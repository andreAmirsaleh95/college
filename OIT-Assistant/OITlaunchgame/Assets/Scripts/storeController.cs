using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class storeController : MonoBehaviour {

    private upgradeManager upgradeManager;
    private sceneManager sceneManager;

    public Button maxBoostsUpgradeButton;
    public Button groundSpeedReductionUpgradeButton;
    public Button launchForceUpgradeButton;
    public Button enemySpeedReductionUpgradeButton;
    public Button truckFrequencyUpgradeButton;
    public Button bombEnemyFrequencyUpgradeButton;
    public Button playButton;
    public Button quitButton;
    public Text scoreText;

    private int[] maxBoostsUpgradeCosts = { 2000, 10000, 20000, 30000 };
    private int[] groundSpeedUpgradeCosts = { 3000, 15000, 30000, 50000 };
    private int[] launchForceUpgradeCosts = { 1000, 5000, 15000, 30000 };
    private int[] enemySpeedUpgradeCosts = { 3000, 15000, 30000, 50000 };
    private int[] truckFrequencyUpgradeCosts = { 1500, 5000, 10000, 20000 };
    private int[] bombEnemyFrequencyUpgradeCosts = { 1250, 4000, 8000, 18000 };

    private int[] maxBoostsUpgradeValues = { 2, 3, 4, 5 };
    private float[] groundSpeedUpgradeValues = { 3.5f, 3, 2.5f, 2 };
    private float[] launchForceUpgradeValues = { 22.5f, 25, 27.5f, 30 };
    private float[] enemySpeedUpgradeValues = { 1, .9f, .8f, .7f };
    private float[] truckFrequencyUpgradeValues = { .03f, .04f, .05f, .06f };
    private float[] bombEnemyFrequencyUpgradeValues = { .08f, .09f, .1f, .11f };

    //add buttons, set text for each upgrade and set to MAX when fully upgraded

    void Start () {

        upgradeManager = GameObject.FindGameObjectWithTag("UpgradeManager").GetComponent<upgradeManager>();
        sceneManager = GameObject.FindGameObjectWithTag("SceneManager").GetComponent<sceneManager>();
        scoreText.text = upgradeManager.getPlayerScore().ToString();
        updateMaxBoostsButton();
        updateGroundSpeedReductionButton();
        updateLaunchForceButton();
        updateEnemySpeedReductionButton();
        updateTruckFrequencyButton();
        updateBombEnemyFrequencyButton();
        initializeMenuButtons();
    }
	
	// Update is called once per frame
	void Update () {
		
	}

    public void initializeButtons()
    {
        maxBoostsUpgradeButton.GetComponentInChildren<Text>().text = maxBoostsUpgradeCosts[upgradeManager.maxBoostsIndex].ToString();
    }

    public void upgradeMaxBoosts()
    {
        if (upgradeManager.getPlayerScore() >= maxBoostsUpgradeCosts[upgradeManager.maxBoostsIndex] && upgradeManager.maxBoostsIndex <= 3)
        {
            upgradeManager.maxBoosts = maxBoostsUpgradeValues[upgradeManager.maxBoostsIndex];
            upgradeManager.setPlayerScore(upgradeManager.getPlayerScore() - maxBoostsUpgradeCosts[upgradeManager.maxBoostsIndex]);
            upgradeManager.maxBoostsIndex += 1;
            updateMaxBoostsButton();
            scoreText.text = upgradeManager.getPlayerScore().ToString();
            //push data to backend
        }
    }


    public void upgradeGroundSpeedReduction()
    {
        if (upgradeManager.getPlayerScore() >= groundSpeedUpgradeCosts[upgradeManager.groundSpeedReductionIndex] && upgradeManager.groundSpeedReductionIndex <= 3)
        {
            upgradeManager.groundSpeedReduction = groundSpeedUpgradeValues[upgradeManager.groundSpeedReductionIndex];
            upgradeManager.setPlayerScore(upgradeManager.getPlayerScore() - groundSpeedUpgradeCosts[upgradeManager.groundSpeedReductionIndex]);
            upgradeManager.groundSpeedReductionIndex += 1;
            updateGroundSpeedReductionButton();
            scoreText.text = upgradeManager.getPlayerScore().ToString();
            //push data to backend
        }
    }

    public void upgradeLaunchForce()
    {
        if (upgradeManager.getPlayerScore() >= launchForceUpgradeCosts[upgradeManager.launchForceIndex] && upgradeManager.launchForceIndex <= 3)
        {
            upgradeManager.launchForce = launchForceUpgradeValues[upgradeManager.launchForceIndex];
            upgradeManager.setPlayerScore(upgradeManager.getPlayerScore() - launchForceUpgradeCosts[upgradeManager.launchForceIndex]);
            upgradeManager.launchForceIndex += 1;
            updateLaunchForceButton();
            scoreText.text = upgradeManager.getPlayerScore().ToString();
            //push to backend
        }
    }

    public void upgradeEnemySpeedReduction()
    {
        if (upgradeManager.getPlayerScore() >= enemySpeedUpgradeCosts[upgradeManager.enemySpeedReductionIndex] && upgradeManager.enemySpeedReductionIndex <= 3)
        {
            upgradeManager.enemySpeedReduction = enemySpeedUpgradeValues[upgradeManager.enemySpeedReductionIndex];
            upgradeManager.setPlayerScore(upgradeManager.getPlayerScore() - enemySpeedUpgradeCosts[upgradeManager.enemySpeedReductionIndex]);
            upgradeManager.enemySpeedReductionIndex += 1;
            updateEnemySpeedReductionButton();
            scoreText.text = upgradeManager.getPlayerScore().ToString();
            //push to backend
        }
    }

    public void upgradeTruckFrequency()
    {
        if (upgradeManager.getPlayerScore() >= truckFrequencyUpgradeCosts[upgradeManager.truckFrequencyIndex] && upgradeManager.truckFrequencyIndex <= 3)
        {
            upgradeManager.truckFrequency = truckFrequencyUpgradeValues[upgradeManager.truckFrequencyIndex];
            upgradeManager.setPlayerScore(upgradeManager.getPlayerScore() - truckFrequencyUpgradeCosts[upgradeManager.truckFrequencyIndex]);
            upgradeManager.truckFrequencyIndex += 1;
            updateTruckFrequencyButton();
            scoreText.text = upgradeManager.getPlayerScore().ToString();
            //push to backend
        }
    }

    public void upgradeBombEnemyFrequency()
    {
        if (upgradeManager.getPlayerScore() >= bombEnemyFrequencyUpgradeCosts[upgradeManager.bombEnemyFrequencyIndex] && upgradeManager.bombEnemyFrequencyIndex <= 3)
        {
            upgradeManager.bombEnemyFrequency = bombEnemyFrequencyUpgradeValues[upgradeManager.bombEnemyFrequencyIndex];
            upgradeManager.setPlayerScore(upgradeManager.getPlayerScore() - bombEnemyFrequencyUpgradeCosts[upgradeManager.bombEnemyFrequencyIndex]);
            upgradeManager.bombEnemyFrequencyIndex += 1;
            updateBombEnemyFrequencyButton();
            scoreText.text = upgradeManager.getPlayerScore().ToString();
            //push to backend
        }
    }

    public void updateMaxBoostsButton()
    {
        if (upgradeManager.maxBoostsIndex <= 3)
        {
            maxBoostsUpgradeButton.GetComponentInChildren<Text>().text = maxBoostsUpgradeCosts[upgradeManager.maxBoostsIndex].ToString();
        }
        else
        {
            maxBoostsUpgradeButton.GetComponentInChildren<Text>().text = "MAX";
        }
    }

    public void updateGroundSpeedReductionButton()
    {
        if (upgradeManager.groundSpeedReductionIndex <= 3)
        {
            groundSpeedReductionUpgradeButton.GetComponentInChildren<Text>().text = groundSpeedUpgradeCosts[upgradeManager.groundSpeedReductionIndex].ToString();
        }
        else
        {
            groundSpeedReductionUpgradeButton.GetComponentInChildren<Text>().text = "MAX";
        }
    }

    public void updateLaunchForceButton()
    {
        if (upgradeManager.launchForceIndex <= 3)
        {
            launchForceUpgradeButton.GetComponentInChildren<Text>().text = launchForceUpgradeCosts[upgradeManager.launchForceIndex].ToString();
        }
        else
        {
            launchForceUpgradeButton.GetComponentInChildren<Text>().text = "MAX";
        }
    }

    public void updateEnemySpeedReductionButton()
    {
        if (upgradeManager.enemySpeedReductionIndex <= 3)
        {
            enemySpeedReductionUpgradeButton.GetComponentInChildren<Text>().text = enemySpeedUpgradeCosts[upgradeManager.enemySpeedReductionIndex].ToString();
        }
        else
        {
            enemySpeedReductionUpgradeButton.GetComponentInChildren<Text>().text = "MAX";
        }
    }

    public void updateTruckFrequencyButton()
    {
        if (upgradeManager.truckFrequencyIndex <= 3)
        {
            truckFrequencyUpgradeButton.GetComponentInChildren<Text>().text = truckFrequencyUpgradeCosts[upgradeManager.truckFrequencyIndex].ToString();
        }
        else
        {
            truckFrequencyUpgradeButton.GetComponentInChildren<Text>().text = "MAX";
        }
    }

    public void updateBombEnemyFrequencyButton()
    {
        if (upgradeManager.bombEnemyFrequencyIndex <= 3)
        {
            bombEnemyFrequencyUpgradeButton.GetComponentInChildren<Text>().text = bombEnemyFrequencyUpgradeCosts[upgradeManager.bombEnemyFrequencyIndex].ToString();
        }
        else
        {
            bombEnemyFrequencyUpgradeButton.GetComponentInChildren<Text>().text = "MAX";
        }
    }

    public void initializeMenuButtons()
    {
        playButton.onClick.AddListener(sceneManager.startGame);
        quitButton.onClick.AddListener(sceneManager.quitGame);
    }
}
