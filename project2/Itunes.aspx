<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Itunes.aspx.cs" Inherits="project2.Itunes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="style.css" rel="stylesheet" type="text/css" />
    <title>Rutvik iTunes store</title>
</head>
<body>
    <header>Rutvik iTunes Store</header>
   <form id="form1" runat="server">
       <asp:Table ID="userinfo" runat="server" controltovalidate="tableuserinfo">
           <asp:TableRow>
               <asp:TableCell> Name:</asp:TableCell>
          <asp:TableCell>
       <asp:TextBox ID="name" runat="server" ></asp:TextBox>
       <asp:RequiredFieldValidator ID="reqName" runat="server"  ValidationGroup="AllValidators" EnableClientScript="False" ControlToValidate="name" Text=" *" ForeColor="Red"></asp:RequiredFieldValidator>
              </asp:TableCell>
               </asp:TableRow>
      
<asp:TableRow>
      <asp:TableCell>Address: </asp:TableCell> 
    <asp:TableCell>
       <asp:TextBox ID="address" runat="server"></asp:TextBox>
       <asp:RequiredFieldValidator ID="reqAddress" runat="server" ValidationGroup="AllValidators" EnableClientScript="False" ControlToValidate="address" Text=" *" ForeColor="Red"></asp:RequiredFieldValidator>
       </asp:TableCell>
    </asp:TableRow>
<asp:TableRow>
      <asp:TableCell>City: </asp:TableCell> 
    <asp:TableCell>
       <asp:TextBox ID="city" runat="server"></asp:TextBox>
       <asp:RequiredFieldValidator ID="reqcity" runat="server" ValidationGroup="AllValidators" EnableClientScript="False" ControlToValidate="city" Text=" *" ForeColor="Red"></asp:RequiredFieldValidator>
        </asp:TableCell>
      </asp:TableRow>
           <asp:TableRow>
       <asp:TableCell>State: </asp:TableCell>
               <asp:TableCell>
       <asp:TextBox ID="state" runat="server"></asp:TextBox>
       <asp:RequiredFieldValidator ID="reqstate" runat="server" ValidationGroup="AllValidators" EnableClientScript="False" ControlToValidate="state" Text=" *" ForeColor="Red"></asp:RequiredFieldValidator>
                   </asp:TableCell>
       </asp:TableRow>
           <asp:TableRow>

       <asp:TableCell>Zip Code: </asp:TableCell> 
               <asp:TableCell>
       <asp:TextBox ID="zip" runat="server" MaxLength="5"></asp:TextBox>
       <asp:RequiredFieldValidator ID="reqzip" runat="server" controltovalidate="zip" ValidationGroup="AllValidators" EnableClientScript="false" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
       <asp:RegularExpressionValidator runat="server" id="rexzip" controltovalidate="zip" ValidationGroup="AllValidators" EnableClientScript="False"></asp:RegularExpressionValidator>
                   </asp:TableCell>
      </asp:TableRow>
           <asp:TableRow>

       <asp:TableCell>Phone Number: </asp:TableCell> 
               <asp:TableCell>
       <asp:TextBox ID="phone" runat="server" MaxLength="10"></asp:TextBox>
       <asp:RequiredFieldValidator ID="reqPhoneNumber" runat="server" ValidationGroup="AllValidators" EnableClientScript="False" ControlToValidate="phone" Text=" *" ForeColor="Red"></asp:RequiredFieldValidator>
       <asp:RegularExpressionValidator runat="server" id="rexphone" controltovalidate="phone" ValidationGroup="AllValidators" EnableClientScript="False"/>
                   </asp:TableCell></asp:TableRow><asp:TableRow>
       <asp:TableCell>Credit Card Number: </asp:TableCell><asp:TableCell>
        <asp:TextBox ID="credit" runat="server" MaxLength="16"></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqCreditCardNumber" runat="server" ValidationGroup="AllValidators" EnableClientScript="False" ControlToValidate="credit" Text=" *" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator runat="server" id="rexCreditCardNumber" controltovalidate="credit" ValidationGroup="AllValidators" EnableClientScript="False" />
                   </asp:TableCell></asp:TableRow><asp:TableRow>
               <asp:TableCell>Expiration:</asp:TableCell><asp:TableCell>
       <asp:DropDownList ID="month" runat="server" AutoPostBack="true">
           <asp:ListItem Enabled="true" Text="Month" Value="month"></asp:ListItem>
            <asp:ListItem Text="01" Value="01"></asp:ListItem>
            <asp:ListItem Text="02" Value="02"></asp:ListItem>
            <asp:ListItem Text="03" Value="03"></asp:ListItem>
             <asp:ListItem Text="04" Value="04"></asp:ListItem>
            <asp:ListItem Text="05" Value="05"></asp:ListItem>
            <asp:ListItem Text="06" Value="06"></asp:ListItem>
             <asp:ListItem Text="07" Value="07"></asp:ListItem>
            <asp:ListItem Text="08" Value="08"></asp:ListItem>
            <asp:ListItem Text="09" Value="09"></asp:ListItem>
              <asp:ListItem Text="10" Value="10"></asp:ListItem>
            <asp:ListItem Text="11" Value="11"></asp:ListItem>
              <asp:ListItem Text="12" Value="12"></asp:ListItem>
       </asp:DropDownList>
       <asp:DropDownList ID="year" runat="server" AutoPostBack="true">
           <asp:ListItem Enabled="true" Text="Year" Value="year"></asp:ListItem>
            <asp:ListItem Text="2021" Value="2021"></asp:ListItem>
            <asp:ListItem Text="2023" Value="2023"></asp:ListItem>
             <asp:ListItem Text="2024" Value="2024"></asp:ListItem>
            <asp:ListItem Text="2025" Value="2025"></asp:ListItem>
            <asp:ListItem Text="2026" Value="2026"></asp:ListItem>
             <asp:ListItem Text="2027" Value="2027"></asp:ListItem>
            <asp:ListItem Text="2028" Value="2028"></asp:ListItem>
            <asp:ListItem Text="2029" Value="2029"></asp:ListItem>
              <asp:ListItem Text="2030" Value="2030"></asp:ListItem>
      </asp:DropDownList>
           </asp:TableCell></asp:TableRow><asp:TableRow>
               <asp:TableCell> Payment Plan:</asp:TableCell><asp:TableCell>
                   <asp:DropDownList ID="plandropdown" runat="server">
            <asp:ListItem Enabled="true" Text="Select a Plane" Value="noplane"></asp:ListItem>
           <asp:ListItem Text="Monthly auto-pay ($20)" Value="monthly"></asp:ListItem>
            <asp:ListItem Text="Annual Service ($200)" Value="annual"></asp:ListItem>
            <asp:ListItem Text="One Time Charge" Value="one"></asp:ListItem>
       </asp:DropDownList></asp:TableCell></asp:TableRow></asp:Table><br />

       <div class="output">
           <asp:Table ID="outputtable" runat="server" Visible="false">
           <asp:TableRow>
               <asp:TableCell>
                   <asp:Label runat="server" ID="lblname" value="name"></asp:Label>
               </asp:TableCell></asp:TableRow><asp:TableRow>
                   <asp:TableCell>
                       <asp:Label runat="server" ID="lbladdress" value="address"></asp:Label>
                   </asp:TableCell></asp:TableRow><asp:TableRow>
               <asp:TableCell>
                   <asp:Label runat="server" ID="lblcity" value="city"></asp:Label>
               </asp:TableCell></asp:TableRow><asp:TableRow>
                   <asp:TableCell>
                       <asp:Label runat="server" ID="lblstate" value="state"></asp:Label>
                   </asp:TableCell></asp:TableRow><asp:TableRow>
               <asp:TableCell>
                   <asp:Label runat="server" ID="lblzip" value="zip"></asp:Label>
               </asp:TableCell></asp:TableRow><asp:TableRow>
                   <asp:TableCell>
                       <asp:Label runat="server" ID="lblphone" value="phone"></asp:Label>
                   </asp:TableCell></asp:TableRow><asp:TableRow>
               <asp:TableCell>
                   <asp:Label runat="server" ID="lblcard" value="credit"></asp:Label>
               </asp:TableCell></asp:TableRow><asp:TableRow>
                   <asp:TableCell>
                       <asp:Label runat="server" ID="lblmonth" value="month"></asp:Label>
                   </asp:TableCell></asp:TableRow><asp:TableRow>
                   <asp:TableCell>
                       <asp:Label runat="server" ID="lblyear" value="year"></asp:Label>
                   </asp:TableCell></asp:TableRow><asp:TableRow>
                   <asp:TableCell>
                       <asp:Label runat="server" ID="lblpurchasetype" value="plandropdown"></asp:Label>
                   </asp:TableCell></asp:TableRow></asp:Table></div><asp:GridView ID="songdisplay" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="SongID">
           <AlternatingRowStyle BackColor="White" />
           <Columns>
               <%--<asp:TemplateField Visible="false">
                   <ItemTemplate>
                       <asp:Label ID="songID" runat="server" Text='<%# Eval("songID") %>'></asp:Label></ItemTemplate></asp:TemplateField>--%>
               <asp:TemplateField HeaderText="Select">
                   <ItemTemplate>
                       <asp:CheckBox ID="songcheckbox" runat="server" />
                   </ItemTemplate>
               </asp:TemplateField>

               <asp:BoundField DataField="SongTitle" HeaderText="Song Title" />
               <asp:BoundField DataField="MusicArtist" HeaderText="Music Artist" />

               <asp:BoundField DataField="Cost" DataFormatString="{00:c}" HeaderText="Cost" /><asp:TemplateField HeaderText="Song Format ">
                   <ItemTemplate>
                       <asp:DropDownList ID="songformatdropdown" runat="server">
                           <asp:ListItem Selected="True" Value="vinyl">Vinyl Record</asp:ListItem><asp:ListItem Value="digital">Digital Download</asp:ListItem><asp:ListItem Value="stream">Stream-Only</asp:ListItem></asp:DropDownList></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="Quantity">
                   <ItemTemplate>
                       <asp:TextBox ID="quantitytextbox" runat="server"></asp:TextBox></ItemTemplate></asp:TemplateField></Columns><FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
           <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
           <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
           <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
           <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
           <SortedAscendingCellStyle BackColor="#FDF5AC" />
           <SortedAscendingHeaderStyle BackColor="#4D0000" />
           <SortedDescendingCellStyle BackColor="#FCF6C0" />
           <SortedDescendingHeaderStyle BackColor="#820000" />
       </asp:GridView>

       <asp:Button ID="submit" runat="server" Text="Submit Order" OnClick="submit_Click" /><br />
       <asp:GridView ID="Receipt" runat="server" AutoGenerateColumns="False" ShowFooter="True" CellPadding="4" ForeColor="#333333" GridLines="None" ><AlternatingRowStyle BackColor="White" />
           <Columns>
               <asp:BoundField DataField="SongTitle" HeaderText="Song Title" />
               <asp:BoundField DataField="Format" HeaderText="Format" />
               <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
               <asp:BoundField DataField="Cost" HeaderText="Price" DataFormatString="{0:c}" />
               <asp:BoundField DataField="TotalCost" HeaderText="Total Cost" DataFormatString="{0:c}" /></Columns>
           <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
           <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
           <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
           <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
           <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
           <SortedAscendingCellStyle BackColor="#FDF5AC" />
           <SortedAscendingHeaderStyle BackColor="#4D0000" />
           <SortedDescendingCellStyle BackColor="#FCF6C0" />
           <SortedDescendingHeaderStyle BackColor="#820000" />
       </asp:GridView>
       <br />
        <asp:Button ID="showstatsbtn" runat="server" Text="Show Statistics" OnClick="showstats" />
       <br />

       <asp:DropDownList ID="songstatsdropdown" runat="server" AutoPostBack="true" OnSelectedIndexChanged="songssoldstatistics" Visible="false" Width="186px">
           <asp:ListItem Enabled="true" Text="Select a Categories" Value="defaultstats"></asp:ListItem><asp:ListItem Text="Song Title" Value="songtitles"></asp:ListItem><asp:ListItem Text="Genre" Value="genre"></asp:ListItem></asp:DropDownList><asp:GridView ID="SongStatistics" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
           <AlternatingRowStyle BackColor="White" />
           <Columns>
               <asp:BoundField DataField="SongTitle" HeaderText="Song Title" />
               <asp:BoundField DataField="MusicArtist" HeaderText="Artist" />
               <asp:BoundField DataField="Genre" HeaderText="Genre" />
               <asp:BoundField DataField="TotalPurchases" HeaderText="Total Sales" />
           </Columns>
           <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
           <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
           <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
           <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
           <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
           <SortedAscendingCellStyle BackColor="#FDF5AC" />
           <SortedAscendingHeaderStyle BackColor="#4D0000" />
           <SortedDescendingCellStyle BackColor="#FCF6C0" />
           <SortedDescendingHeaderStyle BackColor="#820000" />
       </asp:GridView>
       <asp:GridView ID="TotalSongsByGenre" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
           <AlternatingRowStyle BackColor="White" />
           <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
           <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
           <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
           <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
           <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
           <SortedAscendingCellStyle BackColor="#FDF5AC" />
           <SortedAscendingHeaderStyle BackColor="#4D0000" />
           <SortedDescendingCellStyle BackColor="#FCF6C0" />
           <SortedDescendingHeaderStyle BackColor="#820000" />
       </asp:GridView>

       <asp:Button ID="subscription" runat="server" Text="View Subscription" OnClick="viewsubscriptions" />


       <asp:GridView ID="subscriptiontable" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
           <AlternatingRowStyle BackColor="White" />
           <Columns>
               <asp:BoundField DataField="MonthlyTotal" HeaderText="Monthly Total" />
               <asp:BoundField DataField="OneTimePurchaseTotal" HeaderText="one-time " />
               <asp:BoundField DataField="AnnualTotal" HeaderText="Annual Total" />
           </Columns>
           <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
           <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
           <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
           <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
           <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
           <SortedAscendingCellStyle BackColor="#FDF5AC" />
           <SortedAscendingHeaderStyle BackColor="#4D0000" />
           <SortedDescendingCellStyle BackColor="#FCF6C0" />
           <SortedDescendingHeaderStyle BackColor="#820000" />
       </asp:GridView>


   </form>
    </body>
</html>
