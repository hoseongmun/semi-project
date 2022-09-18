package movie.dto;

public class MovieCartDTO {
	private int cart_id;
	private String userid;
	private int sub_code;
	private int amount;
	private String sub_name;
	private int price;
	private int money;
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getSub_code() {
		return sub_code;
	}
	public void setSub_code(int sub_code) {
		this.sub_code = sub_code;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getSub_name() {
		return sub_name;
	}
	public void setSub_name(String sub_name) {
		this.sub_name = sub_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	@Override
	public String toString() {
		return "MovieCartDTO [cart_id=" + cart_id + ", userid=" + userid + ", sub_code=" + sub_code + ", amount="
				+ amount + ", sub_name=" + sub_name + ", price=" + price + ", money=" + money + "]";
	}
	public MovieCartDTO(int cart_id, String userid, int sub_code, int amount, String sub_name, int price, int money) {
		this.cart_id = cart_id;
		this.userid = userid;
		this.sub_code = sub_code;
		this.amount = amount;
		this.sub_name = sub_name;
		this.price = price;
		this.money = money;
	}
	public MovieCartDTO() {

	}
	
}
