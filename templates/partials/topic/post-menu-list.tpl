{{{ if posts.display_moderator_tools }}}
<li>
	<a class="dropdown-item rounded-1 d-flex align-items-center gap-2" component="post/edit" role="menuitem" href="#">
		<span class="menu-icon"><i class="fa fa-fw text-secondary fa-pencil"></i></span> [[topic:edit]]
	</a>
</li>
<li {{{ if posts.deleted }}}hidden{{{ end }}}>
	<a class="dropdown-item rounded-1 d-flex align-items-center gap-2" component="post/delete" role="menuitem" href="#" class="{{{ if posts.deleted }}}hidden{{{ end }}}">
		<span class="menu-icon"><i class="fa fa-fw text-secondary fa-trash-o"></i></span> [[topic:delete]]
	</a>
</li>
<li {{{ if !posts.deleted }}}hidden{{{ end }}}>
	<a class="dropdown-item rounded-1 d-flex align-items-center gap-2" component="post/restore" role="menuitem" href="#" class="{{{ if !posts.deleted }}}hidden{{{ end }}}">
		<span class="menu-icon"><i class="fa fa-fw text-secondary fa-history"></i></span> [[topic:restore]]
	</a>
</li>
{{{ if posts.display_purge_tools }}}
<li {{{ if !posts.deleted }}}hidden{{{ end }}}>
	<a class="dropdown-item rounded-1 d-flex align-items-center gap-2" component="post/purge" role="menuitem" href="#" class="{{{ if !posts.deleted }}}hidden{{{ end }}}">
		<span class="menu-icon"><i class="fa fa-fw text-secondary fa-eraser"></i></span> [[topic:purge]]
	</a>
</li>
{{{ end }}}

{{{ if posts.display_move_tools }}}
<li>
	<a class="dropdown-item rounded-1 d-flex align-items-center gap-2" component="post/move" role="menuitem" href="#">
		<span class="menu-icon"><i class="fa fa-fw text-secondary fa-arrows"></i></span> [[topic:move]]
	</a>
</li>
{{{ end }}}

{{{ if posts.display_change_owner_tools }}}
<li>
	<a class="dropdown-item rounded-1 d-flex align-items-center gap-2" component="post/change-owner" role="menuitem" href="#">
		<span class="menu-icon"><i class="fa fa-fw text-secondary fa-user"></i></span> [[topic:change-owner]]
	</a>
</li>
{{{ end }}}

{{{ if posts.ip }}}
<li>
	<a class="dropdown-item rounded-1 d-flex align-items-center gap-2" component="post/copy-ip" role="menuitem" href="#" data-clipboard-text="{posts.ip}">
		<span class="menu-icon" ><i class="fa fa-fw text-secondary fa-copy"></i></span> [[topic:copy-ip]] {posts.ip}
	</a>
</li>
{{{ if posts.display_ip_ban }}}
<li>
	<a class="dropdown-item rounded-1 d-flex align-items-center gap-2" component="post/ban-ip" role="menuitem" href="#" data-ip="{posts.ip}">
		<span class="menu-icon"><i class="fa fa-fw text-secondary fa-ban"></i></span> [[topic:ban-ip]] {posts.ip}
	</a>
</li>
{{{ end }}}
{{{ end }}}
{{{ end }}}

{{{ each posts.tools }}}
<li {{{ if ./disabled }}}class="disabled" {{{ end }}}>
	<a class="dropdown-item rounded-1 d-flex align-items-center gap-2" {{{ if ./action}}}component="{./action}"{{{ end }}} role="menuitem" href="{{{ if ./href }}}{./href}{{{ else }}}#{{{ end }}}">
		<span class="menu-icon"><i class="fa fa-fw text-secondary {./icon}"></i></span> {{./html}}
	</a>
</li>
{{{ end }}}

{{{ if !posts.deleted }}}
	{{{ if posts.display_history}}}
	<li>
		<a class="dropdown-item rounded-1 d-flex align-items-center gap-2" component="post/view-history" role="menuitem" href="#">
			<span class="menu-icon"><i class="fa fa-fw text-secondary fa-history"></i></span> [[topic:view-history]]
		</a>
	</li>
	{{{ end }}}

	{{{ if config.loggedIn }}}
	<li>
		<a class="dropdown-item rounded-1 d-flex align-items-center gap-2" component="post/bookmark" role="menuitem" href="#" data-bookmarked="{posts.bookmarked}">
			<span class="menu-icon">
				<i component="post/bookmark/on" class="fa fa-fw text-secondary fa-bookmark {{{ if !posts.bookmarked }}}hidden{{{ end }}}"></i>
				<i component="post/bookmark/off" class="fa fa-fw text-secondary fa-bookmark-o {{{ if posts.bookmarked }}}hidden{{{ end }}}"></i>
			</span>
			<span class="bookmark-text">[[topic:bookmark]]</span>
			<span component="post/bookmark-count" class="bookmarkCount badge bg-secondary" data-bookmarks="{posts.bookmarks}">{posts.bookmarks}</span>&nbsp;
		</a>
	</li>
	{{{ end }}}

	<li>
		<a class="dropdown-item rounded-1 d-flex align-items-center gap-2" role="menuitem" href="#" data-clipboard-text="{posts.absolute_url}">
			<i class="fa fa-fw text-secondary fa-link"></i> [[topic:copy-permalink]]
		</a>
	</li>

	{{{ if postSharing.length }}}
	{{{ if config.loggedIn }}}<li class="dropdown-divider"></li>{{{ end }}}
	<li class="dropdown-header">[[topic:share-this-post]]</li>
	{{{ end }}}
	<li class="d-flex gap-2 px-3">
		{{{ each postSharing }}}
		<a class="dropdown-item rounded-1 d-flex align-items-center px-1 py-2 w-auto" role="menuitem" component="share/{./id}" href="#" title="{./name}"><i class="fa-fw text-secondary {./class}"></i></a>
		{{{ end }}}
	</li>
{{{ end }}}

{{{ if posts.display_flag_tools }}}
<li class="dropdown-divider"></li>

<li {{{ if posts.flags.flagged }}}hidden{{{ end }}}>
	<a class="dropdown-item rounded-1 d-flex align-items-center gap-2" component="post/flag" role="menuitem" href="#"><i class="fa fa-fw text-secondary fa-flag"></i> [[topic:flag-post]]</a>
</li>
<li {{{ if !posts.flags.flagged }}}hidden{{{ end }}} class="disabled text-secondary">
	<a class="dropdown-item rounded-1 d-flex align-items-center gap-2" component="post/already-flagged" role="menuitem" href="#"><i class="fa fa-fw text-secondary fa-flag"></i> [[topic:already-flagged]]</a>
</li>

{{{ if (!posts.selfPost && posts.uid) }}}
<li>
	<a class="dropdown-item rounded-1 d-flex align-items-center gap-2" component="post/flagUser" role="menuitem" href="#"><i class="fa fa-fw text-secondary fa-flag"></i> [[topic:flag-user]]</a>
</li>
{{{ end }}}
{{{ end }}}

{{{ if posts.display_moderator_tools }}}
{{{ if posts.flags.exists }}}
<li>
	<a class="dropdown-item rounded-1 d-flex align-items-center gap-2" role="menuitem" href="{config.relative_path}/flags/{posts.flags.flagId}"><i class="fa fa-fw text-secondary fa-exclamation-circle"></i> [[topic:view-flag-report]]</a>
</li>
{{{ if (posts.flags.state == "open") }}}
<li>
	<a class="dropdown-item rounded-1 d-flex align-items-center gap-2" component="post/flagResolve" data-flagId="{posts.flags.flagId}" role="menuitem" href="#"><i class="fa fa-fw text-secondary fa-check"></i> [[topic:resolve-flag]]</a>
</li>

{{{ end }}}
{{{ end }}}
{{{ end }}}
<li>
    <a class="dropdown-item rounded-1 d-flex align-items-center gap-2" component="post/notes" role="menuitem" href="#" data-post-id="{posts.pid}">
        <span class="menu-icon"><i class="fa fa-fw fa-sticky-note"></i></span> [[topic:manage-notes]]
    </a>
</li>

<!-- Modal Structure -->
<div id="notesModal" style="display:none; position:fixed; top:20%; left:50%; transform:translate(-50%, -50%); width:400px; background-color:white; border:1px solid #ccc; z-index:10000; padding:20px;">
    <div class="modal-header">
        <h5>Manage Notes</h5>
        <button id="closeModalBtn" style="background:none; border:none; font-size:20px; cursor:pointer;">&times;</button>
    </div>
    <div class="modal-body">
        <!-- New section to display saved notes -->
        <div id="savedNotesDisplay" style="border:1px solid #ccc; padding:10px; min-height:50px; background-color:#f9f9f9; margin-bottom:15px;">
            <!-- Saved notes will appear here -->
        </div>
        <!-- Textarea for adding new notes -->
        <textarea id="userNotes" rows="5" style="width: 100%;" placeholder="Write your new note here..."></textarea>
    </div>
    <div class="modal-footer" style="margin-top: 10px; text-align: right;">
        <button id="saveNotesBtn" style="padding:10px 20px; background-color:blue; color:white; border:none; cursor:pointer;">Save</button>
        <button id="closeModalFooterBtn" style="padding:10px 20px; background-color:grey; color:white; border:none; cursor:pointer;">Close</button>
    </div>
</div>

<script>
// Function to safely parse JSON or return an empty array if invalid
function safelyParseJSON(value) {
    try {
        return JSON.parse(value);
    } catch (e) {
        return [];  // Return an empty array if parsing fails
    }
}

var currentPostId = null;  // Keep track of the current post being edited

// Attach the event handler to the notes button
document.addEventListener('click', function(e) {
    const notesButton = e.target.closest('a[component="post/notes"]');

    if (notesButton) {
        e.preventDefault();

        // Try to get the post element by traversing up the DOM tree
        const postElement = notesButton.closest('[data-pid], [id^="post_"], [id^="p"]');

        if (postElement) {
            // Try to get the postId from data-pid or id attribute
            if (postElement.hasAttribute('data-pid')) {
                currentPostId = postElement.getAttribute('data-pid');
            } else if (postElement.id) {
                // id could be in the format 'post_12345' or 'p12345'
                currentPostId = postElement.id.replace('post_', '').replace('p', '');
            }
        }

        if (!currentPostId) {
            console.error('Post ID not found!');
            return;
        }

        var storageKey = 'postNotes_' + currentPostId;

        console.log('Manage Notes button clicked for post:', currentPostId);

        // Get existing notes from localStorage, safely parse them as an array
        var existingNotes = safelyParseJSON(localStorage.getItem(storageKey)) || [];

        // Clear the display area before adding notes
        var savedNotesDisplay = document.getElementById('savedNotesDisplay');
        savedNotesDisplay.innerHTML = ''; // Clear the content

        // Display existing notes if they exist
        if (existingNotes.length > 0) {
            savedNotesDisplay.innerHTML = existingNotes.map(note => note + '<br>').join('');
        } else {
            savedNotesDisplay.innerHTML = 'No notes yet.';
        }

        // Clear the new note input field
        document.getElementById('userNotes').value = '';

        // Show the modal
        document.getElementById('notesModal').style.display = 'block';

        // Close the dropdown to avoid it interfering with future clicks
        closeDropdownMenu(notesButton);

        // Ensure the save button doesn't get multiple listeners attached
        document.getElementById('saveNotesBtn').removeEventListener('click', handleSaveButtonClick); // Remove any previous listeners
        document.getElementById('saveNotesBtn').addEventListener('click', handleSaveButtonClick); // Attach the new listener
    }
});

// Function to handle the save button click
function handleSaveButtonClick() {
    if (!currentPostId) {
        alert('Error: No post ID found.');
        return;
    }

    var storageKey = 'postNotes_' + currentPostId;

    // Get the new note from the textarea
    var newNote = document.getElementById('userNotes').value.trim();

    if (newNote === '') {
        alert('Please write something before saving.');
        return;
    }

    // Get existing notes from localStorage (safely parsed as an array)
    var existingNotes = safelyParseJSON(localStorage.getItem(storageKey)) || [];

    // Append the new note to the existing notes array
    existingNotes.push(newNote);

    // Save the updated notes array back to localStorage as a JSON string
    localStorage.setItem(storageKey, JSON.stringify(existingNotes));

    // Notify the user of success
    alert('Note saved successfully.');

    // Hide the modal
    document.getElementById('notesModal').style.display = 'none';

    // Reset the dropdown state after saving
    resetDropdownState();
}

// Function to close the dropdown menu when a note button is clicked
function closeDropdownMenu(buttonElement) {
    const dropdownMenu = buttonElement.closest('.dropdown-menu');
    if (dropdownMenu) {
        dropdownMenu.classList.remove('show');
        const parentDropdown = dropdownMenu.closest('.dropdown');
        if (parentDropdown) {
            parentDropdown.classList.remove('show');
        }
    }
}

// Handle the Close button clicks (both the close icon and the footer close button)
function closeNotesModal() {
    document.getElementById('notesModal').style.display = 'none';

    // Reset the currentPostId and any states related to dropdowns
    currentPostId = null;

    // Reset the dropdown state after closing
    resetDropdownState();
}

// Function to reset the dropdown state globally
function resetDropdownState() {
    // Reactivate any dropdown menus that may be stuck in the "open" state
    const allDropdowns = document.querySelectorAll('.dropdown-menu.show');
    allDropdowns.forEach(dropdown => {
        dropdown.classList.remove('show');
    });
}

document.getElementById('closeModalBtn').addEventListener('click', closeNotesModal);
document.getElementById('closeModalFooterBtn').addEventListener('click', closeNotesModal);
</script>



