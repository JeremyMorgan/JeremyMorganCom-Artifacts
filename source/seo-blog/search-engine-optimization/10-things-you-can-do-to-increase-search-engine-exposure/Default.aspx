<script language="c#" runat="server">
	private void Page_Load(object sender, System.EventArgs e)
	{
		Response.Status = "301 Moved Permanently";
		Response.AddHeader("Location","/blog/seo/10-things-you-can-do-to-increase-search-engine-exposure/");
	}
</script>
