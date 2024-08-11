import { useEffect, useState } from "react";

export const useDebounce = (value: string, delay: number) => {
  const [deValue, setDeValue] = useState(value);
  
  useEffect(() => {
    const timeout = setTimeout(() => {
      setDeValue(value);
    }, delay);
    return () => clearTimeout(timeout);
  }, [value, delay]);

  return deValue;
};
