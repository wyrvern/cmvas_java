 import java.util.Collection;
 import java.util.Vector;
 import javax.swing.table.AbstractTableModel;
 
public class m_table_model {
	
   public static final int TITLE_INDEX  = 0;
   public static final int ARTIST_INDEX = 1;
   public static final int ALBUM_INDEX  = 2;
   public static final int HIDDEN_INDEX = 3;
   
   protected String[] columnNames;
   protected Vector dataVector;
   
   public m_table_model (String[] columnNames) {
      this.columnNames = columnNames;
      dataVector = new Vector();
   }
   
   public String getColumnName(int column) {
      return columnNames[column];
   }
   
   public boolean isCellEditable(int row, int column) {
      return true;
   }  
   
   public void setValueAt(Object value, int row, int column) {
   }
   
   public int getRowCount() {
      return 1;
   }
   
   public int getColumnCount() {
      return 1;
   }
   
   public boolean hasEmptyRow() {
      return true;
   }
   
   public void addEmptyRow() {
 
  }

}