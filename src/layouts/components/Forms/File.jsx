import React from "react";

const File = ({ id, name, label, helpText, reference, onChange }) => {
  return (
    <div className="my-3">
      <div className="label">
        <span className="label-text">{label}</span>
      </div>
      <input
        className="block w-full text-md text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400"
        id={id}
        name={name}
        type="file"
        accept=".sql"
        ref={reference}
        onChange={onChange}
        required
      />
      <div className="label">
        <span className="label-text-alt text-md text-slate-500">
          {helpText}
        </span>
      </div>
    </div>
  );
};

export default File;
