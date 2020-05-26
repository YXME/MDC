function doChange(cbox)
{
    var checkbox = document.getElementById(cbox);
    var cases = document.getElementsByClassName('depManga')

    if (checkbox.disabled == true)
    {
    	return;
    }
    else if (checkbox.checked)
    {
      for(var i=0; i < cbox.length; i++)
      {
          cbox[i].disabled = false;
      }
    }
    else
    {
      for(var i=0; i < cbox.length; i++)
      {
          cbox[i].disabled = true;
      }
    }
}
