package test2;

public class Test {

    private int value;

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
        System.out.println("value set to " + value);
    }

    public static void main(String[] args) {
        Test test = new Test();
        test.setValue(10);
        System.out.println("Current value: " + test.getValue());

        for (int i = 1; i <= 3; i++) {
            System.out.println("i = " + i);
        }
    }
}
