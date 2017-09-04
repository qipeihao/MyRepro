package yh.entity;

public class Dept {
	private int deptNo;
	private String deptName;
	private String location1;

	public Dept() {
		super();
	}

	public Dept(int deptNo) {
		super();
		this.deptNo = deptNo;
	}

	public Dept(int deptNo, String deptName) {
		super();
		this.deptNo = deptNo;
		this.deptName = deptName;
	}

	public int getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

}
