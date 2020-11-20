<#import "parts/common.ftl" as c>

<@c.page>
<h3>List of users</h3>
<style>
    table, td, th {
        border: 1px solid #999;
        padding: 5px;
    }
</style>

<table>
    <thead>
    <tr>
        <th>Name</th>
        <th>Role</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <#list users as user>
        <tr>
            <td>${user.username}</td>
            <td><#list user.roles as role>${role}<#sep>, </#list></td>
            <td><a href="/user/${user.id}">edit</a></td>
        </tr>
    </#list>
    </tbody>
</table>
</@c.page>
