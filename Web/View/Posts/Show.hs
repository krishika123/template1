module Web.View.Posts.Show where
import Web.View.Prelude
import qualified Text.MMark as MMark

data ShowView = ShowView { post :: Include "comments" Post  }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={PostsAction}>Posts</a></li>
                <li class="breadcrumb-item active">Show Post</li>
            </ol>
        </nav>
        
        <h1>{post.title}</h1>
        <p> {post.createdAt |> date} ({post.createdAt |>timeAgo})</p>
        <div> {post.body |> renderMarkdown} </div>
        <div> {forEach post.comments renderComment} </div>

        <a href={NewCommentAction post.id}>Add Comment</a>
    |]
        where
            breadcrumb = renderBreadcrumb
                            [ breadcrumbLink "Posts" PostsAction
                            , breadcrumbText "Show Post"
                            ]

renderMarkdown text = 
    case text |>MMark.parse "" of
        Left error -> "Something went wrong"
        Right markdown -> MMark.render markdown |> tshow |> preEscapedToHtml
renderComment comment = [hsx|
        <div class="mt-4">
            <div class="postrows">
                <div>
                    <h5>{comment.author}</h5>
                </div>
                <div>
                        <p>{comment.createdAt |> timeAgo}</p>
                </div>
            </div>
            <div class="postcolumn">
                <div>
                    <p>{comment.body}</p>
                </div>
            </div>
        </div>     
    |]
