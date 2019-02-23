<script language="c#" runat="server">
	private void Page_Load(object sender, System.EventArgs e)
	{
		Response.Status = "301 Moved Permanently";
		Response.AddHeader("Location","/blog/social-media/five-reasons-why-im-not-giving-up-on-google/");
	}
</script>
