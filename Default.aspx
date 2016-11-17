<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1"  ContentPlaceHolderID="head" Runat="Server" CssClass="cpHead" >
   
    CSU Course Schedule
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" Runat="Server">


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

    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3">
        <AlternatingItemTemplate>
            <h2>Test</h2>
            <h3>Test</h3>

            <table>

               <tr style="background-color: #FFFFFF; color: #284775;">
                    <td>
                        <asp:Label Text='<%# Eval("subjType") %>' runat="server" ID="Label1" />
                        <asp:Label Text='<%# Eval("subjID") %>' runat="server" ID="Label2" /></td>               
                 </tr>  
                                             
                <tr style="background-color: #FFFFFF; color: #284775;">
                    <td>
                        <asp:Label Text='<%# Eval("description") %>' runat="server" ID="descriptionLabel" /></td>

                </tr>

               
            </table>
            
            
            
            <tr style="background-color: #FFFFFF; color: #284775;">
                <td>
                    <asp:Label Text='<%# Eval("crn") %>' runat="server" ID="crnLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("crsSection") %>' runat="server" ID="crsSectionLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("weekDay") %>' runat="server" ID="weekDayLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("beginTime") %>' runat="server" ID="beginTimeLabel" />
                    <asp:Label Text='<%# Eval("endTime") %>' runat="server" ID="endTimeLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("building") %>' runat="server" ID="buildingLabel" />
                    <asp:Label Text='<%# Eval("roomNum") %>' runat="server" ID="roomNumLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("beginDate") %>' runat="server" ID="beginDateLabel" />
                    <asp:Label Text='<%# Eval("endDate") %>' runat="server" ID="endDateLabel" /></td>
               <!-- -->
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color: #999999;">
                <td>
                    <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" />
                    <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("crn") %>' runat="server" ID="crnLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("crsSection") %>' runat="server" ID="crsSectionLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("weekDay") %>' runat="server" ID="weekDayLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("beginTime") %>' runat="server" ID="beginTimeLabel" />
                    <asp:Label Text='<%# Eval("endTime") %>' runat="server" ID="endTimeLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("building") %>' runat="server" ID="buildingLabel" />
                    <asp:Label Text='<%# Eval("roomNum") %>' runat="server" ID="roomNumLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("beginDate") %>' runat="server" ID="beginDateLabel" />
                    <asp:Label Text='<%# Eval("endDate") %>' runat="server" ID="endDateLabel" /></td>
                <!--<td>
                    <asp:TextBox Text='<%# Bind("description") %>' runat="server" ID="descriptionTextBox" /></td>-->
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" />
                    <asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("crn") %>' runat="server" ID="crnLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("crsSection") %>' runat="server" ID="crsSectionLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("weekDay") %>' runat="server" ID="weekDayLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("beginTime") %>' runat="server" ID="beginTimeLabel" />
                    <asp:Label Text='<%# Eval("endTime") %>' runat="server" ID="endTimeLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("building") %>' runat="server" ID="buildingLabel" />
                    <asp:Label Text='<%# Eval("roomNum") %>' runat="server" ID="roomNumLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("beginDate") %>' runat="server" ID="beginDateLabel" />
                    <asp:Label Text='<%# Eval("endDate") %>' runat="server" ID="endDateLabel" /></td>
                <!--<td>
                    <asp:TextBox Text='<%# Bind("description") %>' runat="server" ID="descriptionTextBox" /></td>-->
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr></tr>
            <tr style="background-color: #E0FFFF; color: #333333;">
                <td>
                    <asp:Label Text='<%# Eval("crn") %>' runat="server" ID="crnLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("crsSection") %>' runat="server" ID="crsSectionLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("weekDay") %>' runat="server" ID="weekDayLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("beginTime") %>' runat="server" ID="beginTimeLabel" />
                    <asp:Label Text='<%# Eval("endTime") %>' runat="server" ID="endTimeLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("building") %>' runat="server" ID="buildingLabel" />
                    <asp:Label Text='<%# Eval("roomNum") %>' runat="server" ID="roomNumLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("beginDate") %>' runat="server" ID="beginDateLabel" />
                    <asp:Label Text='<%# Eval("endDate") %>' runat="server" ID="endDateLabel" /></td>
                <!--<td>
                    <asp:Label Text='<%# Eval("description") %>' runat="server" ID="descriptionLabel" /></td>-->
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table runat="server" id="itemPlaceholderContainer" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;" border="1">
                            <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                                <th runat="server">CRN</th>
                                <th runat="server">Section</th>
                                <th runat="server">Day</th>
                                <th runat="server">Time</th>
                                <th runat="server">Location</th>
                                <th runat="server">Begin/End Dates</th>
                            </tr>
                            <tr runat="server" id="itemPlaceholder"></tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF"></td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color: #E2DED6; font-weight: bold; color: #333333;">
                <td>
                    <asp:Label Text='<%# Eval("crn") %>' runat="server" ID="crnLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("crsSection") %>' runat="server" ID="crsSectionLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("weekDay") %>' runat="server" ID="weekDayLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("beginTime") %>' runat="server" ID="beginTimeLabel" />
                    <asp:Label Text='<%# Eval("endTime") %>' runat="server" ID="endTimeLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("building") %>' runat="server" ID="buildingLabel" />
                    <asp:Label Text='<%# Eval("roomNum") %>' runat="server" ID="roomNumLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("beginDate") %>' runat="server" ID="beginDateLabel" />
                    <asp:Label Text='<%# Eval("endDate") %>' runat="server" ID="endDateLabel" /></td>
                <!--<td>
                    <asp:Label Text='<%# Eval("description") %>' runat="server" ID="descriptionLabel" /></td>-->
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>

    
</asp:Content>

