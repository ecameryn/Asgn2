<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1"  ContentPlaceHolderID="head" Runat="Server" CssClass="cpHead" >
   
    <h1>CSU Course Schedule</h1>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server" >


    Choose a semester: <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="term" DataValueField="termID" AutoPostBack="True"></asp:DropDownList>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:dbHolstickAsgn2ConnectionString2 %>' SelectCommand="SELECT [term], [termID] FROM [semesters] ORDER BY [term]"></asp:SqlDataSource>

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

            <h2 class="boxed"><asp:Label Text='<%# Eval("subjID") %>' runat="server" ID="Label13" />
            <asp:Label Text='<%# Eval("subjType") %>' runat="server" ID="Label14" /></h2>
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
                        <asp:Label Text='<%# Eval("beginTime") %>' runat="server" ID="Label10" />
                        <asp:Label Text='<%# Eval("endTime") %>' runat="server" ID="Label9" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("building") %>' runat="server" ID="Label7" />
                        <asp:Label Text='<%# Eval("roomNum") %>' runat="server" ID="Label8" /></td>
                    <td>
                        <asp:Label Text='<%# Eval("beginDate") %>' runat="server" ID="Label12" />
                        <asp:Label Text='<%# Eval("endDate") %>' runat="server" ID="Label11" /></td>
                </tr>
            </table><br /><br /><br /><br />

            <!--<asp:Label Text='<%# Eval("subjID") %>' runat="server" ID="Label2" />
            <asp:Label Text='<%# Eval("subjType") %>' runat="server" ID="Label3" />
            <asp:Label Text='<%# Eval("description") %>' runat="server" ID="Label1" />
            crn:
            <asp:Label Text='<%# Eval("crn") %>' runat="server" ID="crnLabel" /><br />
            crsSection:
            <asp:Label Text='<%# Eval("crsSection") %>' runat="server" ID="crsSectionLabel" /><br />
            termID:
            <asp:Label Text='<%# Eval("termID") %>' runat="server" ID="termIDLabel" /><br />
            instrID:
            <asp:Label Text='<%# Eval("instrID") %>' runat="server" ID="instrIDLabel" /><br />
            subjID:
            <asp:Label Text='<%# Eval("subjID") %>' runat="server" ID="subjIDLabel" /><br />
            subjType:
            <asp:Label Text='<%# Eval("subjType") %>' runat="server" ID="subjTypeLabel" /><br />
            weekDay:
            <asp:Label Text='<%# Eval("weekDay") %>' runat="server" ID="weekDayLabel" /><br />
            beginTime:
            <asp:Label Text='<%# Eval("beginTime") %>' runat="server" ID="beginTimeLabel" /><br />
            endTime:
            <asp:Label Text='<%# Eval("endTime") %>' runat="server" ID="endTimeLabel" /><br />
            timeOfDay:
            <asp:Label Text='<%# Eval("timeOfDay") %>' runat="server" ID="timeOfDayLabel" /><br />
            building:
            <asp:Label Text='<%# Eval("building") %>' runat="server" ID="buildingLabel" /><br />
            roomNum:
            <asp:Label Text='<%# Eval("roomNum") %>' runat="server" ID="roomNumLabel" /><br />
            beginDate:
            <asp:Label Text='<%# Eval("beginDate") %>' runat="server" ID="beginDateLabel" /><br />
            endDate:
            <asp:Label Text='<%# Eval("endDate") %>' runat="server" ID="endDateLabel" /><br />
            description:
            <asp:Label Text='<%# Eval("description") %>' runat="server" ID="descriptionLabel" /><br />
            <br />-->
        </ItemTemplate>
    </asp:DataList>

    
</asp:Content>

