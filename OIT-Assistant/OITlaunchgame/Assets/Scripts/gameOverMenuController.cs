using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class gameOverMenuController : MonoBehaviour {

    public float transitionTime;
    public Color gameOverBackgroundColor;
    public gameController gameController;
    public Text distanceText;

    private Image gameOverBackground;
    private bool isGameOver;
    private sceneManager sceneManager;
    private Button[] buttons;
    private Button restartButton;
    private Button storeButton;
    private Button quitButton;

	void Start () {
        sceneManager = GameObject.FindGameObjectWithTag("SceneManager").GetComponent<sceneManager>();
    }
	
	void Update () {

        if (isGameOver)
        {
            gameOverBackground = GetComponentInChildren<Image>();
            gameOverBackground.transform.GetChild(0).gameObject.SetActive(true);
            initializeButtons();
            gameOverBackground.color = Color.Lerp(gameOverBackground.color, gameOverBackgroundColor, transitionTime * Time.deltaTime);
            gameOverBackground.rectTransform.sizeDelta = Vector2.MoveTowards(gameOverBackground.rectTransform.sizeDelta, new Vector2(Screen.width / 2.5f, gameOverBackground.rectTransform.sizeDelta.y), transitionTime * Time.deltaTime);
            distanceText.text = gameController.getDistanceStr();
        }
    }

    public void setIsGameOver(bool b)
    {
        this.isGameOver = b;
    }

    public void initializeButtons()
    {
        buttons = GetComponentsInChildren<Button>();
        restartButton = buttons[0];
        storeButton = buttons[1];
        quitButton = buttons[2];
        restartButton.onClick.AddListener(sceneManager.startGame);
        storeButton.onClick.AddListener(sceneManager.goToStore);
        quitButton.onClick.AddListener(sceneManager.quitGame);
    }
}
