<%@ Page Title="Columbus State University" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1"  ContentPlaceHolderID="head" Runat="Server" >
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server" >

    <h1>CSU Course Shedule</h1><br /><br />

    Choose a semester: <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="term" DataValueField="termID" AutoPostBack="True"></asp:DropDownList>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:dbHolstickAsgn2ConnectionString2 %>' SelectCommand="SELECT [term], [termID] FROM [semesters] ORDER BY [term]"></asp:SqlDataSource>
    <br /><br />
    Choose a subject: <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="subjType" DataValueField="subjType"></asp:DropDownList>
    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:dbHolstickAsgn2ConnectionString2 %>' SelectCommand="SELECT DISTINCT [subjType] FROM [subjects]"></asp:SqlDataSource>


    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:dbHolstickAsgn2ConnectionString2 %>' SelectCommand="SELECT * FROM [courses] WHERE (([termID] = @termID) AND ([subjType] = @subjType))">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="termID" Type="Int32"></asp:ControlParameter>
            <asp:ControlParameter ControlID="DropDownList2" PropertyName="SelectedValue" Name="subjType" Type="String"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource3">
        <ItemTemplate>

            <h2 class="boxed"><asp:Label Text='<%# Eval("subjType") %>' runat="server" ID="Label14" />
                              <asp:Label Text='<%# Eval("subjID") %>' runat="server" ID="Label13" /></h2>

            <h3 class="boxed"><asp:Label Text='<%# Eval("description") %>' runat="server" ID="Label15" /></h3>

           <table id="table1">
                <tr>
                    <th>CRN</th>
                    <th>Section</th>
                    <th>Day</th>
                    <th>Time</th>
                    <th>Location</th>
                    <th>Begin/End Dates</th>
                </tr>
                <tr>
                    <td>
                        <asp:Label Text='<%# Eval("crn") %>' runat="server" ID="Label4" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("crsSection") %>' runat="server" ID="Label5" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("weekDay") %>' runat="server" ID="Label6" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("beginTime") %>' runat="server" ID="Label10" /> -
                        <asp:Label Text='<%# Eval("endTime") %>' runat="server" ID="Label9" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("building") %>' runat="server" ID="Label7" />
                        <asp:Label Text='<%# Eval("roomNum") %>' runat="server" ID="Label8" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("beginDate") %>' runat="server" ID="Label12" /> / <br />

                       <asp:Label Text='<%# Eval("endDate") %>' runat="server" ID="Label11" /></td>
                </tr>
            </table>

        </ItemTemplate>
    </asp:DataList>

    
</asp:Content>

