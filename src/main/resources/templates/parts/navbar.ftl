<#include "security.ftl">
<#import "login.ftl" as l>

<nav class="navbar navbar-dark bg-dark navbar-light bg-light">
    <a class="navbar-brand" href="/song/list">Music</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <#if !isAdmin>
                <li class="nav-item">
                    <a class="nav-link" href="/song/my-list">My music</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/song/add">New music</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/playlist/list">My playlist</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/playlist/new">New playlist</a>
                </li>
            </#if>

            <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-link" href="/song/my-list">My music</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/song/add">New music</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/user/list">User list</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/playlist/list">Playlist list</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/playlist/new">New playlist</a>
                </li>
            </#if>
        </ul>

        <div class="navbar-text mr-4">${name}</div>
        <#if known>
            <@l.logout />
        </#if>
        <#if !known>
            <a href="/login" class="btn btn-primary" role="button">Sign in</a>
        </#if>

    </div>
</nav>
