public class abc {
    public int exec ( String f ) {
       System.out.println(f);
       return 1;
    }

    public static void main(String[] args) {
        abc f = new abc();
        f.exec("1");
    }
}
