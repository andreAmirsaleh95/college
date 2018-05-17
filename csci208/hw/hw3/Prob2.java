/**
 * Contains main method
 *
 * @author Andre Amirsaleh
 */
public class Prob2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Animal myDog = new Dog();
        System.out.println(
                "The following line prints Woof, thus Java uses dynamic method binding");
        myDog.saySomething();
    }
}

/**
 * Parent
 *
 * @author Andre Amirsaleh
 */
class Animal {
    public void saySomething() {
        System.out.println("Hi");
    }
}

/**
 * Child
 *
 * @author Andre Amirsaleh
 */
class Dog extends Animal {
    public void saySomething() {
        System.out.println("Woof");
    }
}
