package movie.dto;

public class MovieSubDTO {
	private String sub_name; // 구독권 이름
	private int price; //가격
	private String description; 
	private String filename; 
	private String sub_code;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getSub_code() {
		return sub_code;
	}
	public void setSub_code(String sub_code) {
		this.sub_code = sub_code;
	}
	@Override
	public String toString() {
		return "MovieSubDTO [sub_name=" + sub_name + ", price=" + price + ", description=" + description + ", filename="
				+ filename + ", sub_code=" + sub_code + "]";
	}
	public MovieSubDTO(String sub_name, int price, String description, String filename, String sub_code) {
		this.sub_name = sub_name;
		this.price = price;
		this.description = description;
		this.filename = filename;
		this.sub_code = sub_code;
	}
	public MovieSubDTO() {

	}
	
}
