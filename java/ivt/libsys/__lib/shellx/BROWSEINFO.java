package lib.shellx;

/** @dll.struct() */
public class BROWSEINFO
{
  public int    hwndOwner;
  public int    pidlRoot;
  public String pszDisplayName;// Return display name of item selected.
  public String lpszTitle; // text to go in the banner over the tree.
  public int    ulFlags;// Flags that control the return stuff
  public int    lpfn;
  public int    lParam; // extra info that's passed back in callbacks
  public int    iImage; // output var: where to return the Image index.
}
