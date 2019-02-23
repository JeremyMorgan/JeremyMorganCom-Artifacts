<script language="c#" runat="server">
	private void Page_Load(object sender, System.EventArgs e)
	{
		Response.Status = "301 Moved Permanently";
		Response.AddHeader("Location","/tutorials/c-sharp/how-to-write-text-files-in-c/");
	}
</script>
