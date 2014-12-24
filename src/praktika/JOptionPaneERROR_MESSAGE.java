package praktika;

import javax.swing.JOptionPane;
import javax.swing.JPanel;

public class JOptionPaneERROR_MESSAGE {

  public static void main(String[] args) {
    final JPanel panel = new JPanel();

    JOptionPane.showMessageDialog(panel, "Pasahitza edo erabiltzailea txarto sartuta daude", "Errorea", JOptionPane.ERROR_MESSAGE);

  }
}