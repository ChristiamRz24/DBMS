import React, { useRef, useState } from "react";

const BackupDB = ({ id, pageName }) => {
  const dialogREF = useRef(null);
  const [isBackup, setIsBackup] = useState(false);

  const handleSetBackup = () => setIsBackup(!isBackup);
  const handleCloseDialog = () => {
    dialogREF.current.close();
    setIsBackup(false);
  };

  console.log(isBackup);
  if (isBackup) {
    fetch("/api/postgresql/files/backup.json")
      .then(async (response) => {
        let filename = response.headers
          .get("Content-Disposition")
          .split("=")[1];

        // Quitar comillas alrededor del nombre del archivo, si las hay
        filename = filename.replace(/"/g, "");

        console.log("filename:", filename);
        const blob = await response.blob();
        const url = window.URL.createObjectURL(blob);
        const a = document.createElement("a");
        a.href = url;
        a.download = filename;
        a.click();
        window.URL.revokeObjectURL(url);
        handleCloseDialog();

        alert(`Base de datos ${pageName} respaldada con éxito!`);
      })
      .catch((error) => {
        console.error("Error:", error);
        setIsBackup(false);
      });
  }

  return (
    <dialog
      id={id}
      ref={dialogREF}
      className="modal modal-bottom sm:modal-middle"
    >
      <div className="modal-box">
        <h3 className="font-bold text-lg">Respaldar Base de Datos</h3>
        <div className="modal-action w-full mt-0">
          <button
            type="button"
            onClick={handleCloseDialog}
            className="btn btn-sm btn-circle btn-ghost absolute right-2 top-2"
          >
            ✕
          </button>
          <div className="flex flex-col w-full">
            {isBackup && (
              <div className="flex my-10 justify-center items-center gap-2">
                <p className="text-sm">Respaldando base de datos</p>
                <span className="loading loading-dots loading-md"></span>
              </div>
            )}
            {!isBackup && (
              <p className="text-sm text-center my-10">
                ¿Desea respaldar la base de datos <strong>{pageName}</strong>?
              </p>
            )}
            <div className="ms-auto">
              <button
                type="button"
                onClick={handleCloseDialog}
                className="btn btn-outline"
              >
                Cancelar
              </button>
              <button
                type="button"
                onClick={handleSetBackup}
                // className="btn btn-accent ms-2"
                className={`btn ${isBackup ? "btn-disabled" : "btn-accent"} ms-2`}
              >
                {isBackup && (
                  <>
                    &nbsp;&nbsp;&nbsp;
                    <span className="loading loading-spinner loading-xs"></span>
                    &nbsp;&nbsp;&nbsp;
                  </>
                )}
                {!isBackup && "Confirmar"}
              </button>
            </div>
          </div>
        </div>
      </div>
    </dialog>
  );
};

export default BackupDB;
