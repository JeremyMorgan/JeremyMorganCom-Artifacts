<script language="c#" runat="server">
	private void Page_Load(object sender, System.EventArgs e)
	{
		Response.Status = "301 Moved Permanently";
		Response.AddHeader("Location","/tutorials/python-tutorials/how-to-connect-to-mysql-with-python/");
	}
</script>
