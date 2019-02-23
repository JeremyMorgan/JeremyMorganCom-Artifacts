<script language="c#" runat="server">
	private void Page_Load(object sender, System.EventArgs e)
	{
		Response.Status = "301 Moved Permanently";
		Response.AddHeader("Location","/tutorials/c-programming/how-to-capture-the-output-of-a-linux-command-in-c/");
	}
</script>
