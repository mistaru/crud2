<#import "parts/common.ftl" as c>
<@c.page>

    <a class="btn btn-danger" data-toggle="collapse" href="#collapseExampleS" role="button" aria-expanded="false"
       aria-controls="collapseExampleS">
        Search song
    </a>


    <a class="btn btn-warning" data-toggle="collapse" href="#collapseExampleD" role="button" aria-expanded="false"
       aria-controls="collapseExampleD">
        New song
    </a>

    <a class="btn btn-success" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
       aria-controls="collapseExample">
        Delete song
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


    <table id="tblData" class="table">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Название</th>
            <th scope="col">Испольнитель</th>
            <th scope="col">Альбом</th>
            <th scope="col">Жанр</th>
            <th scope="col"></th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>


        <#if Song??>
            <#list Song as Song>
                <tr>
                    <td>${Song.name}</td>
                    <td>${Song.singer}</td>
                    <td>${Song.album}</td>
                    <td>${Song.style}</td>
                    <td>
                        <a href="/song/edit/${Song.id}" class="card-link">Редактировать</a>
                        <a href="/edit/delete/${Song.id}" class="card-link">Удалить</a>
                    </td>
                </tr>
            <#else>
                Список пуст!
            </#list>
        </#if>
    </table>
</@c.page>