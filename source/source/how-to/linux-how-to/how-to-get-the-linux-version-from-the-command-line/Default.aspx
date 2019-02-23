<script language="c#" runat="server">
	private void Page_Load(object sender, System.EventArgs e)
	{
		Response.Status = "301 Moved Permanently";
		Response.AddHeader("Location","/tutorials/linux/how-to-get-the-linux-version-from-the-command-line/");
	}
</script>
