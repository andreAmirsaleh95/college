using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
/*
using Firebase;
using Firebase.Database;
using Firebase.Unity.Editor;
*/

public class upgradeManager : MonoBehaviour {

    static upgradeManager instance;

    public int maxBoosts; // 1
    public float groundSpeedReduction; // 4
    public float launchForce; // 18
    public float enemySpeedReduction; // 1.2
    public float truckFrequency; // .025
    public float bombEnemyFrequency; // .06

    public int maxBoostsIndex = 0;
    public int groundSpeedReductionIndex = 0;
    public int launchForceIndex = 0;
    public int enemySpeedReductionIndex = 0;
    public int truckFrequencyIndex = 0;
    public int bombEnemyFrequencyIndex = 0;
    public float highScore;
    public int playerScore;// = 100000;
    /*
    private Firebase.Auth.FirebaseAuth auth;
    private Firebase.Auth.FirebaseUser user;
    private DatabaseReference dbReference;
    private DatabaseReference userRef;
    */
    //private DatabaseReference gameDataReference;
    private string userId;

    public Image birdImg;

    void Awake () {

        if (instance != null)
        {
            GameObject.Destroy(gameObject);
        }
        else
        {
            GameObject.DontDestroyOnLoad(gameObject);
            instance = this;
            /*Firebase code
            FirebaseApp.DefaultInstance.SetEditorDatabaseUrl("https://oitlaunchgame.firebaseio.com/");
            FirebaseApp.DefaultInstance.SetEditorP12FileName("OITLaunchGame-P12.p12");
            FirebaseApp.DefaultInstance.SetEditorServiceAccountEmail("p12account@oitlaunchgame.iam.gserviceaccount.com");
            FirebaseApp.DefaultInstance.SetEditorP12Password("notasecret");
            dbReference = FirebaseDatabase.DefaultInstance.RootReference;
            userId = "L-R7zeKSvjGOE-oUN2J";
            //Debug.Log("db ref : " + dbReference);
            //auth = Firebase.Auth.FirebaseAuth.DefaultInstance;
            //test database
            //userEmail = "jsp029@bucknell.edu";
            //userPassword = "MCorleone7474!!";
            checkForUser();
            //createUser();
            //checkIfFirstTime();
            //
            //user = auth.CurrentUser;
            getUserGameData();
            // pull all info from backend
            */
        }
    }
	
	void Update () {
		
	}
    /*
    public void signIn()
    {
        auth.SignInWithEmailAndPasswordAsync(userEmail, userPassword).ContinueWith(task => {
            if (task.IsCanceled)
            {
                Debug.LogError("SignInWithEmailAndPasswordAsync was canceled.");
                return;
            }
            if (task.IsFaulted)
            {
                Debug.LogError("SignInWithEmailAndPasswordAsync encountered an error: " + task.Exception);
                return;
            }

            Firebase.Auth.FirebaseUser newUser = task.Result;
            Debug.LogFormat("User signed in successfully: {0} ({1})",
                newUser.DisplayName, newUser.UserId);
        });
    }

    public void createUser()
    {
        auth.CreateUserWithEmailAndPasswordAsync(userEmail, userPassword).ContinueWith(task => {
            if (task.IsCanceled)
            {
                Debug.LogError("CreateUserWithEmailAndPasswordAsync was canceled.");
                return;
            }
            if (task.IsFaulted)
            {
                Debug.LogError("CreateUserWithEmailAndPasswordAsync encountered an error: " + task.Exception);
                return;
            }

            // Firebase user has been created.
            Firebase.Auth.FirebaseUser newUser = task.Result;
            Debug.LogFormat("Firebase user created successfully: {0} ({1})",
                newUser.DisplayName, newUser.UserId);
            Debug.Log("id : " + newUser.ToString());
            User user = new User(newUser.Email, new upgradeInfo());
            createNewUserForJson(user, user.upgradeInfo, newUser.UserId);
        });

        //dbReference.Child("users");
    }
    
    public void checkIfFirstTime()
    {
        if (PlayerPrefs.GetInt("FIRSTTIMEOPENING", 1) == 1)
        {
            //Debug.Log("First Time Opening");

            //Set first time opening to false
            PlayerPrefs.SetInt("FIRSTTIMEOPENING", 0);

            //createUser();

        }
        else
        {
            Debug.Log("NOT First Time Opening");

            //signIn();
        }
    }
    
    public void checkForUser()
    {
        //FirebaseDatabase = new FirebaseDatabase("https://oitlaunchgame.firebaseio.com/");

        if (getUserReference(userId) != null)
        {
            //sign in
            //birdImg.color = Color.black;
            userRef = getUserReference(userId);
        }

        else
        {
            //create new
            User user = new User();
            createNewUserForJson(user);
        }
    }

    public void createNewUserForJson(User user)
    {
        string userJson = JsonUtility.ToJson(user);
        //getUserReference().SetRawJsonValueAsync(userJson);
        //string gameDataJson = JsonUtility.ToJson(gameData);
        string key = dbReference.Child("users").Push().Key;
        DatabaseReference userRef = getUserReference(key);
        userRef.SetRawJsonValueAsync(userJson);
        //key = userRef.Push().Key;
        //getDataSnapshot();
        //getUserGameDataReference(userRef).SetRawJsonValueAsync(gameDataJson);
    }

    public void getDataSnapshot()
    {
        dbReference.Child("users").GetValueAsync().ContinueWith(task => {
          if (task.IsFaulted)
          {
                Debug.Log("data snapshot fucked up");
                return;
          }
          else if (task.IsCompleted)
          {
              DataSnapshot snapshot = task.Result;
              Debug.Log("data : " + snapshot.ToString());
          }
      });
    }
    
    public DatabaseReference getUserReference(string id)
    {
        return dbReference.Child("users").Child(id);
    }

    public DatabaseReference getUserGameDataReference(DatabaseReference user)
    {
        return user.Child("gameData");
    }

    public void pushUserGameData()
    {

    }

    public void pullUserGameData()
    {

    }


    // send email and password to Unity from Ionic using start method (delimit by space), split string, use them to sign in -- store in userEmail/userPassword

    public void setUserId(string message)
    {
        this.userId = message;
    }

    public void getUserGameData()
    {

    }
    */
    public int getPlayerScore()
    {
        return this.playerScore;
    }

    public void setPlayerScore(int newScore)
    {
        playerScore = newScore;
    }
}
