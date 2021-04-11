package handlers

import (
	"net/http"
	"os"
	"path"
	"time"

	"streamline/utils"
)

// UploadHandler handles for http delete
type FileDashDeleteHandler struct {
	BaseDir string
}

func (d *FileDashDeleteHandler) isFileUploadingDone(file string) bool {
	symlink := file + ".symlink"
	if _, err := os.Stat(symlink); err == nil {
		// exist, then segment uploading is not finished yet
		return false
	}
	// not exist
	return true
}

func (d *FileDashDeleteHandler) ServeHTTP(w http.ResponseWriter, req *http.Request) {
	utils.GetUploadLogger().Infof("Received upload request\n")
	curFileURL := req.URL.EscapedPath()[len("/dash"):]
	curFilePath := path.Join(d.BaseDir, curFileURL)
	d.serveHTTPImpl(curFilePath, w, req)
}

func (d *FileDashDeleteHandler) serveHTTPImpl(curFilePath string, w http.ResponseWriter, req *http.Request) {
	// check file existing
	if _, err := os.Stat(curFilePath); err != nil {
		utils.GetDeleteLogger().Debugf("file %s not exists \n", curFilePath)
		return
	}

	is_chunk_uploading_done := d.isFileUploadingDone(curFilePath)
	if !is_chunk_uploading_done { // chunk uploading is not done yet
		return
	}

	if err := os.Remove(curFilePath); err != nil {
		utils.GetDeleteLogger().Errorf("Failed to delete file %s with %v \n", curFilePath, err)
		return
	}

	utils.GetDeleteLogger().Debugf("file %s was deleted exists @ %v \n", curFilePath, time.Now().Format(time.RFC3339))
}
