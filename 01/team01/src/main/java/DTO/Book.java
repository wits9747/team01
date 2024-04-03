package DTO;

public class Book {

	private String bname;
	private String isbn;
	private String author;
	private String category;
	private String make_Date;
    private int total;
    private int no;

    public Book() {

    }

    public Book(String bname, String isbn, String author, String category, String make_Date, int total) {
    	this.bname= bname;
    	this.isbn = isbn;
        this.author = author;
        this.category = category;
        this.make_Date = make_Date;
        this.total = total;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getmake_Date() {
        return make_Date;
    }

    public void setmake_Date(String make_Date) {
        this.make_Date = make_Date;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

	@Override
	public String toString() {
		return "Book [bname=" + bname + ", isbn=" + isbn + ", author=" + author + ", category=" + category
				+ ", make_Date=" + make_Date + ", total=" + total + ", no=" + no + "]";
	}



}
