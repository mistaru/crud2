<#import "parts/common.ftl" as c>
<@c.page>

    <a class="btn btn-danger" data-toggle="collapse" href="#collapseExampleS" role="button" aria-expanded="false"
       aria-controls="collapseExampleS">
        Search song
    </a>
    <div class="collapse" id="collapseExampleS">
        <div class="form-group mt-3">
            <form method="post" action="filter">
                <select name="criterion" class="custom-select">
                    <option selected="selected">criterion</option>
                    <option>name</option>
                    <option>singer</option>
                    <option>album</option>
                    <option>style</option>
                </select>
                <div>
                    <input type="text" class="form-control" name="filter" placeholder="search">
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <div>
                    <button type="submit" class="btn btn-danger">Search</button>
                </div>
            </form>
        </div>
    </div>

    <a class="btn btn-warning" data-toggle="collapse" href="#collapseExampleD" role="button" aria-expanded="false"
       aria-controls="collapseExampleD">
        New song
    </a>
    <div class="collapse" id="collapseExampleD">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" class="form-control" name="name" placeholder="Name"/>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="singer" placeholder="Singer"/>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="album" placeholder="Album"/>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="style" placeholder="Style"/>
                </div>

                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <div class="form-group">
                    <button type="submit" class="btn btn-warning">Append</button>
                </div>
            </form>
        </div>
    </div>


    <a class="btn btn-success" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
       aria-controls="collapseExample">
        Delete song
    </a>
    <div class="collapse" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data" action="delete">
                <div class="form-group">
                    <input type="text" class="form-control" name="name" placeholder="Name"/>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="singer" placeholder="Singer"/>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <div class="form-group">
                    <button type="submit" class="btn btn-success">Delete</button>
                </div>
            </form>
        </div>
    </div>

    <a class="btn btn-dark" href="/editSong">Edit Song</a>


    <#if SongExc??>
        <div>
            <br>
            <h2>${SongExc}</h2>
        </div>
    </#if>

    <#if SongAdd??>
        <div>
            <br>
            <h2>${SongAdd}</h2>
        </div>
    </#if>

   <div class="card">
        <#list Song as Song>
            <div class="card my-3">

                <div class="m-2">
                    <h6>${Song.name}</h6>
                    <span>${Song.singer}|</span>
                    <span>${Song.album}|</span>
                    <span>${Song.style}</span>
                    <div class="card-footer text-muted">
                        ${Song.authorName}
                    </div>
                </div>
            </div>
        <#else>
            No message
        </#list>
    </div>
</@c.page>