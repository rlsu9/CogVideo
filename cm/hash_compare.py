import hashlib

def hash_file(file_path):
    """Calculate SHA-256 hash of a file."""
    sha256_hash = hashlib.sha256()
    
    with open(file_path, "rb") as f:
        # Read and update hash string value in chunks of 4MB to handle large files
        for byte_block in iter(lambda: f.read(4096), b""):
            sha256_hash.update(byte_block)
    
    return sha256_hash.hexdigest()

def compare_safetensors_hash(file1, file2):
    """Compare the hash of two safetensors files."""
    hash1 = hash_file(file1)
    hash2 = hash_file(file2)
    
    if hash1 == hash2:
        print("The files are identical (same hash).")
    else:
        print("The files are different (different hash).")
        print(f"Hash of {file1}: {hash1}")
        print(f"Hash of {file2}: {hash2}")

# Example usage
file1 = "/lustre/scratch/users/hao.zhang/rlsu_files/ckptfolder/cogvid_2b_turbo/huber/3e-7/1.0/checkpoint-10/transformer/diffusion_pytorch_model.safetensors"
file2 = "/lustre/scratch/users/hao.zhang/rlsu_files/ckptfolder/cogvid_2b_turbo/huber/3e-7/1.0/checkpoint-5/transformer/diffusion_pytorch_model.safetensors"
compare_safetensors_hash(file1, file2)
