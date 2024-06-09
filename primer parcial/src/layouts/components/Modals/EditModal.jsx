import React, { useRef } from "react";
import putData from "../../../services/putData";

const EditModal = ({
  id,
  type,
  dataType,
  oldData,
  pageName,
  lastURL,
  children,
}) => {
  const dialogREF = useRef(null);

  const oldName = oldData.usename;
  const oldRole = oldData.role;

  const handleSubmit = async (event) => {
    event.preventDefault();

    const data = new FormData(event.target);
    data.append("oldName", oldName);
    data.append("oldRole", oldRole);

    const baseURL = `http://localhost:4321/api/${pageName}/${lastURL}`;

    try {
      // response = updated | error
      const response = await putData(baseURL, data);

      if (response.message === "error") {
        alert(`Error al actualizar el ${dataType}`);
      }
      if (response.message === "updated") location.reload();
    } catch (error) {
      console.error(error);
    }

    handleCloseDialog();
  };

  const handleCloseDialog = () => dialogREF.current.close();

  return (
    <dialog
      id={id}
      ref={dialogREF}
      className="modal modal-bottom sm:modal-middle"
    >
      <div className="modal-box">
        <h3 className="font-bold text-lg">
          {type} {dataType}
        </h3>
        <div className="modal-action w-full mt-0">
          <button
            type="button"
            onClick={handleCloseDialog}
            className="btn btn-sm btn-circle btn-ghost absolute right-2 top-2"
          >
            X {/* Close icon */}
          </button>
          <form
            method="dialog"
            onSubmit={handleSubmit}
            className="flex flex-col gap-3 w-full"
          >
            {/* Form fields */}
            {children}
            {/* Form actions */}
            <div className="ms-auto">
              <button
                type="button"
                className="btn btn-outline"
                onClick={handleCloseDialog}
              >
                Cancelar
              </button>
              <button type="submit" className="btn btn-accent ms-1">
                {type}
              </button>
            </div>
          </form>
        </div>
      </div>
    </dialog>
  );
};

export default EditModal;
