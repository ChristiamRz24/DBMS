import React, { useRef } from "react";
import postData from "../../../services/postData";

const BaseAddModal = ({ id, type, dataType, pageName, lastURL, children }) => {
  const dialogREF = useRef(null);

  const handleSubmit = async (event) => {
    event.preventDefault();

    const data = new FormData(event.target);
    console.log(Object.fromEntries(data));

    const baseURL = `http://localhost:4321/api/${pageName}/${lastURL}`;
    console.log(baseURL);

    try {
      // response = Data created | Data already exists
      const response = await postData(baseURL, data);
      console.log(response);

      if (response.message === "created") location.reload();
      if (response.message === "already exists") {
        alert(`El ${dataType} ya existe`);
      }
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

export default BaseAddModal;
