package main

import (
	"flag"
	"log"
	"net/http"
	"path/filepath"
	"time"

	"streamline/handlers"
	"streamline/utils"
	"github.com/gorilla/mux"
	"github.com/rs/cors"
)
func main() {
	flag.Parse()
	args := flag.Args()
	if len(args) != 1 || args[0] == "" {
		utils.GetMainLogger().Errorf("Usage: need base dir\n")
		return
	}

	filePath, err := filepath.Abs(args[0])
	if err != nil {
		utils.GetMainLogger().Errorf("Cannot resolve this path %s\n", filePath)
		return
	}

	utils.GetMainLogger().Infof("baseDir %v \n", filePath)

	// clean the segment folder
	utils.RemoveContents(args[0])

	file_dashdownloadHandler := &handlers.FileDashDownloadHandler{
		StartTime: time.Now(),
		BaseDir:   filePath,
	}

	file_dashuploadHandler := &handlers.FileDashUploadHandler{
		BaseDir: filePath,
	}

	dash_playHandler := &handlers.DashPlayHandler{
		BaseDir: filePath,
	}

	file_dashdeleteHandler := &handlers.FileDashDeleteHandler{
		BaseDir: filePath,
	}

	file_hlsdownloadHandler := &handlers.FileHLSDownloadHandler{
		StartTime: time.Now(),
		BaseDir:   filePath,
	}

	file_hlsuploadHandler := &handlers.FileHLSUploadHandler{
		BaseDir: filePath,
	}

	file_hlsdeleteHandler := &handlers.FileHLSDeleteHandler{
		BaseDir: filePath,
	}

	r := mux.NewRouter()

	r.Handle("/dash/{folder}/{name:[a-zA-Z0-9/_-]+}.{name:[a-zA-Z0-9/_-]+}", file_dashuploadHandler).Methods("PUT", "POST")
	r.Handle("/dash/{folder}/{name:[a-zA-Z0-9/_-]+}.{name:[a-zA-Z0-9/_-]+}", file_dashdownloadHandler).Methods("GET")
	r.Handle("/dash/{folder}/{name:[a-zA-Z0-9/_-]+}.{name:[a-zA-Z0-9/_-]+}", file_dashdeleteHandler).Methods("DELETE")
	r.Handle("/dashplay/{folder}/{name:[a-zA-Z0-9/_-]+}.{name:[a-zA-Z0-9/_-]+}", dash_playHandler)
	r.Handle("/hls/{folder}/{name:[a-zA-Z0-9/_-]+}.{name:[a-zA-Z0-9/_-]+}", file_hlsuploadHandler).Methods("PUT", "POST")
	r.Handle("/hls/{folder}/{name:[a-zA-Z0-9/_-]+}.{name:[a-zA-Z0-9/_-]+}", file_hlsdownloadHandler).Methods("GET")
	r.Handle("/hls/{folder}/{name:[a-zA-Z0-9/_-]+}.{name:[a-zA-Z0-9/_-]+}", file_hlsdeleteHandler).Methods("DELETE")
	r.Handle("/", dash_playHandler)

	// KJSL: Adding CORS
	c := cors.New(cors.Options{
		AllowedOrigins: []string{"*"},
		AllowCredentials: true,
	})
	rcors := c.Handler(r)

	utils.GetMainLogger().Infof("start server\n")
	log.Fatal(http.ListenAndServe(":8080", rcors))
}
