package yh.entity;

public class Position {
     private int positionID;
     private String positionName;
     
     
	public Position() {
		super();
	}
	
	public Position(int positionID) {
		super();
		this.positionID = positionID;
	}

	public Position(int positionID, String positionName) {
		super();
		this.positionID = positionID;
		this.positionName = positionName;
	}


	public int getPositionID() {
		return positionID;
	}
	public void setPositionID(int positionID) {
		this.positionID = positionID;
	}
	public String getPositionName() {
		return positionName;
	}
	public void setPositionName(String positionName) {
		this.positionName = positionName;
	}
     
     
}
