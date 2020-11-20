<#import "parts/common.ftl" as c>

<@c.page>
<a class="btn btn-danger" data-toggle="collapse" href="#collapseExampleP" role="button" aria-expanded="false"
   aria-controls="collapseExampleP">
    New list
</a>
<div class="collapse" id="collapseExampleP">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" class="form-control" name="name" placeholder="Name"/>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="description" placeholder="Description"/>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <div class="form-group">
                <button type="submit" class="btn btn-danger">Append</button>
            </div>
        </form>
    </div>
</div>


<a class="btn btn-info" data-toggle="collapse" href="#collapseExampleAddP" role="button" aria-expanded="false"
   aria-controls="collapseExampleAddP">
    Add song
</a>
<div class="collapse" id="collapseExampleAddP">
    <div class="form-group mt-2">
        <form method="post" action="addPlaylist">
            <div><select name="nameSong" class="custom-select">
                    <option selected="selected">Selected song</option>
                    <#if Song1??>
                        <#list Song1 as Song1>
                            <option>${Song1.name}</option>
                        </#list>
                    </#if>
                </select>
            </div>

            <div>
                <select name="namePlaylist" class="custom-select">
                    <option selected="selected">Select playlist</option>
                    <#if playlistList??>
                        <#list playlistList as playlistList>
                            <option>${playlistList.name}</option>
                        </#list>
                    </#if>
                </select>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <div>
                <button type="submit" class="btn btn-info">Append</button>
            </div>
        </form>
    </div>
</div>

<a class="btn btn-secondary" data-toggle="collapse" href="#collapseExampleSearch" role="button"
   aria-expanded="false"
   aria-controls="collapseExampleSearch">
    Search
</a>
<div class="collapse" id="collapseExampleSearch">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data" action="filterPlaylist">
            <div class="form-group">
                <input type="text" class="form-control" name="name" placeholder="Name"/>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <div class="form-group">
                <button type="submit" class="btn btn-secondary">Search</button>
            </div>
        </form>
    </div>
</div>

<a class="btn btn-warning" data-toggle="collapse" href="#collapseExampleMS" role="button" aria-expanded="false"
   aria-controls="collapseExampleMS">
    Delete
</a>
<div class="collapse" id="collapseExampleMS">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data" action="deletePlaylist">
            <div class="form-group">
                <input type="text" class="form-control" name="name" placeholder="Name"/>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <div class="form-group">
                <button type="submit" class="btn btn-warning">Remove</button>
            </div>
        </form>
    </div>
</div>



<a class="btn btn-warning" data-toggle="collapse" href="#collapseExampleViewSong" role="button" aria-expanded="false"
   aria-controls="collapseExampleViewSong">
    View songs
</a>
<div class="collapse" id="collapseExampleViewSong">
    <div class="form-group mt-3">
        <form method="post" action="ListOfSong">
            <div>
                <select name="playlistName" class="custom-select">
                    <option selected="selected">Selected song</option>
                    <#if playlistList??>
                        <#list playlistList as playlistList>
                            <option>${playlistList.name}</option>
                        </#list>
                    </#if>
                </select>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <div class="form-group">
                <button type="submit" class="btn btn-warning">Show</button>
            </div>
        </form>
    </div>
</div>
<#--

<a class="btn btn-warning" data-toggle="collapse" href="#collapseExampleDS" role="button" aria-expanded="false"
   aria-controls="collapseExampleDS">
    Delete Song
</a>
<div class="collapse" id="collapseExampleDS">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data" action="deleteSong">
            <div>
                <select name="playlist" class="custom-select">
                    <option selected="selected">Select playlist</option>
                    <#if playlistList??>
                        <#list playlistList as playlistList>
                            <option>${playlistList.name}</option>
                        </#list>
                    </#if>
                </select>
            </div>

            <div class="form-group">
                <input type="text" class="form-control" name="name" placeholder="Name"/>
            </div>

            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <div class="form-group">
                <button type="submit" class="btn btn-warning">Remove</button>
            </div>
        </form>
    </div>
</div>
-->
    <div class="card-columns">
        <#if playlistList??>
            <#list playlistList as playlistList>
                <div class="card my-3">

                    <div class="m-2">
                        <b>${playlistList.name}</b>
                        <div class="card-footer text-muted">
                            ${playlistList.authorName}
                        </div>
                    </div>
                </div>
            <#else>
                No message
            </#list>
        </#if>
    </div>


    <#if songs??>
        <#list songs as songs>
            <div class="card">

                <div class="m-2">
                    <b>${songs.name}</b>
                    <div class="card-footer text-muted">
                        ${songs.authorName}
                    </div>
                </div>
            </div>
        <#else>
            No message
        </#list>
    </#if>


<#if PlDelete??>
    <div>
        <br>
        <h2>${PlDelete}</h2>
    </div>
</#if>

<#if addSongs??>
    <div>
        <br>
        <h2>${addSongs}</h2>
    </div>
</#if>

<div>
    <#if playFilter??>
        <br>
        <b>ID:${playFilter.id}</b>

        <div>
            <b>Name:${playFilter.name}</b>
        </div>
        <div>
            <b>Author:${playFilter.authorName}</b>

            <div>
                <b>Description:${playFilter.description}</b>
            </div>
        </div>
    </#if>
    </@c.page>

