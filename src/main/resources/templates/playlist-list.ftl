<#include "parts/security.ftl">
<#import "parts/common.ftl" as c>

<@c.page>

    <div class="container py-5">
        <div class="row">
            <div class="col-lg-9 mx-auto bg-white rounded shadow">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th scope="col" class="col-3">Name</th>
                            <th scope="col" class="col-3">Description</th>
                            <th scope="col" class="col-3">Author</th>
                            <th scope="col" class="col-3">Edit</th>
                            <th scope="col" class="col-3">Details</th>
                            <th scope="col" class="col-3">Delete</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#if playlistList??>
                            <#list playlistList as playlistList>
                                <tr>
                                    <td class="col-3">${playlistList.name}</td>
                                    <td class="col-3">${playlistList.description}</td>
                                    <td class="col-3">${playlistList.author.username}</td>
                                    <td class="col-3">
                                        <#if !isAdmin>
                                        <a href="/playlist/edit/${playlistList.id}" class="card-link">
                                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil-fill"
                                                 fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                <path fill-rule="evenodd"
                                                      d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>
                                            </svg>
                                        </a>
                                        </#if>
                                    </td>

                                    <td class="col-3">
                                        <a href="/playlist/details/${playlistList.id}" class="card-link">
                                            <svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-music-note-list"
                                                 fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M12 13c0 1.105-1.12 2-2.5 2S7 14.105 7 13s1.12-2 2.5-2 2.5.895 2.5 2z"/>
                                                <path fill-rule="evenodd" d="M12 3v10h-1V3h1z"/>
                                                <path d="M11 2.82a1 1 0 0 1 .804-.98l3-.6A1 1 0 0 1 16 2.22V4l-5 1V2.82z"/>
                                                <path fill-rule="evenodd"
                                                      d="M0 11.5a.5.5 0 0 1 .5-.5H4a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 7H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 3H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5z"/>
                                            </svg>
                                        </a>
                                    </td>
                                    <td class="col-3">
                                        <#if !isAdmin>
                                    <a href="/playlist/delete/${playlistList.id}" class="card-link">
                                        <svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-trash-fill"
                                             fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd"
                                                  d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5a.5.5 0 0 0-1 0v7a.5.5 0 0 0 1 0v-7z"/>
                                        </svg>
                                    </a>
                                        </#if>
                                    </td>
                                </tr>
                           <#else>
                                List is empty!
                            </#list>
                        </#if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</@c.page>

