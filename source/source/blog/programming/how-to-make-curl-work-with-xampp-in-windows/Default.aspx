<script language="c#" runat="server">
	private void Page_Load(object sender, System.EventArgs e)
	{
		Response.Status = "301 Moved Permanently";
		Response.AddHeader("Location","/tutorials/php-tutorials/how-to-make-curl-work-with-xampp-in-windows/");
	}
</script>
