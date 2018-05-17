public class TV {
    int width;
    int height;
	public TV() {
	}
	public TV(TV old) {
		this.width = old.width;
		this.height = old.height;
	}
    public String toString() {
	return "W " + width + " H " + height;
    }
   
}
