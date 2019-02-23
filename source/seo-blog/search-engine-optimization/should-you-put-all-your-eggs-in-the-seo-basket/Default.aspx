<script language="c#" runat="server">
	private void Page_Load(object sender, System.EventArgs e)
	{
		Response.Status = "301 Moved Permanently";
		Response.AddHeader("Location","/blog/seo/should-you-put-all-your-eggs-in-the-seo-basket/");
	}
</script>
