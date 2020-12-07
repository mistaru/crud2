<#import "parts/common.ftl" as c>
<@c.page>

    <div class="form-group mt-3">
        <form method="post">
            <div><select name="nameEdit" class="custom-select">
                    <option selected="selected">Selected song</option>
                    <#list SongEdit as SongUser>
                        <option>${SongEdit.name}</option>
                    </#list>
                </select>
            </div>
            <div>
                <input type="text" class="form-control" name="name" placeholder="New name">
            </div>
            <div>
                <input type="text" class="form-control" name="singer" placeholder="New singer">
            </div>
            <div>
                <input type="text" class="form-control" name="album" placeholder="New album">
            </div>
            <div>
                <input type="text" class="form-control" name="style" placeholder="New style">
            </div>

            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <div>
                <button type="submit" class="btn btn-danger">Edit</button>
            </div>
        </form>
    </div>
</@c.page>