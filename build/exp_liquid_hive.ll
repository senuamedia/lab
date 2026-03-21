; ModuleID = 'simplex_program'
target triple = "x86_64-apple-macosx14.0.0"

declare ptr @malloc(i64)
declare void @free(ptr)
declare void @intrinsic_println(ptr)
declare void @intrinsic_print(ptr)
declare void @"print_i64"(i64)
declare ptr @intrinsic_int_to_string(i64)
declare ptr @intrinsic_string_new(ptr)
declare ptr @intrinsic_string_from_char(i64)
declare i64 @intrinsic_string_len(ptr)
declare ptr @intrinsic_string_concat(ptr, ptr)
declare ptr @intrinsic_string_slice(ptr, i64, i64)
declare i64 @intrinsic_string_char_at(ptr, i64)
declare i1 @intrinsic_string_eq(ptr, ptr)
declare i64 @intrinsic_string_to_int(ptr)
declare i64 @"String_from"(i64)
declare i64 @"String_len"(i64)
declare ptr @intrinsic_vec_new()
declare void @intrinsic_vec_push(ptr, ptr)
declare ptr @intrinsic_vec_get(ptr, i64)
declare i64 @intrinsic_vec_len(ptr)
declare void @intrinsic_vec_set(ptr, i64, ptr)
declare ptr @intrinsic_vec_pop(ptr)
declare void @intrinsic_vec_clear(ptr)
declare void @intrinsic_vec_remove(ptr, i64)
declare ptr @intrinsic_get_args()
declare ptr @intrinsic_read_file(ptr)
declare void @intrinsic_write_file(ptr, ptr)
declare ptr @store_ptr(ptr, i64, ptr)
declare ptr @store_i64(ptr, i64, i64)
declare ptr @load_ptr(ptr, i64)
declare i64 @load_i64(ptr, i64)
; Timing intrinsics
declare i64 @intrinsic_get_time_ms()
declare i64 @intrinsic_get_time_us()
declare i64 @intrinsic_get_time_ns()
; Float bit conversion intrinsics
declare i64 @"f64_to_bits"(double)
declare i64 @"bits_to_f64"(i64)
; Arena allocator intrinsics
declare ptr @intrinsic_arena_create(i64)
declare ptr @intrinsic_arena_alloc(ptr, i64)
declare void @intrinsic_arena_reset(ptr)
declare void @intrinsic_arena_free(ptr)
declare i64 @intrinsic_arena_used(ptr)
; StringBuilder intrinsics
declare ptr @intrinsic_sb_new()
declare ptr @intrinsic_sb_new_cap(i64)
declare void @intrinsic_sb_append(ptr, ptr)
declare void @intrinsic_sb_append_char(ptr, i64)
declare void @intrinsic_sb_append_i64(ptr, i64)
declare ptr @intrinsic_sb_to_string(ptr)
declare void @intrinsic_sb_clear(ptr)
declare void @intrinsic_sb_free(ptr)
declare i64 @intrinsic_sb_len(ptr)
; File I/O intrinsics
declare ptr @intrinsic_getenv(ptr)
declare i64 @intrinsic_file_exists(ptr)
declare i64 @intrinsic_is_file(ptr)
declare i64 @intrinsic_is_directory(ptr)
declare i64 @intrinsic_file_size(ptr)
declare i64 @intrinsic_file_mtime(ptr)
declare i64 @intrinsic_remove_path(ptr)
declare i64 @intrinsic_mkdir_p(ptr)
declare ptr @intrinsic_get_cwd()
declare i64 @intrinsic_set_cwd(ptr)
declare ptr @intrinsic_list_dir(ptr)
declare ptr @intrinsic_path_join(ptr, ptr)
declare ptr @intrinsic_path_dirname(ptr)
declare ptr @intrinsic_path_basename(ptr)
declare ptr @intrinsic_path_extension(ptr)
declare i64 @file_copy(ptr, ptr)
declare i64 @file_rename(ptr, ptr)
declare void @stderr_write(ptr)
declare void @stderr_writeln(ptr)
; Error handling intrinsics
declare void @intrinsic_panic(ptr)
declare void @intrinsic_print_stack_trace()
; Process intrinsics
declare i64 @intrinsic_process_run(ptr)
declare ptr @intrinsic_process_output(ptr)
; Phase 20: REPL/I/O intrinsics
declare ptr @intrinsic_read_line()
declare i64 @intrinsic_is_tty()
declare i64 @intrinsic_stdin_has_data()
declare i64 @intrinsic_string_hash(ptr)
declare i64 @intrinsic_string_find(ptr, ptr, i64)
declare ptr @intrinsic_string_trim(ptr)
declare ptr @intrinsic_string_split(ptr, ptr)
declare i64 @intrinsic_string_starts_with(ptr, ptr)
declare i64 @intrinsic_string_ends_with(ptr, ptr)
declare i64 @intrinsic_string_contains(ptr, ptr)
declare ptr @intrinsic_string_replace(ptr, ptr, ptr)
declare ptr @intrinsic_string_lines(ptr)
declare ptr @intrinsic_string_join(ptr, ptr)
declare ptr @intrinsic_string_to_lowercase(ptr)
declare ptr @intrinsic_string_to_uppercase(ptr)
declare i64 @intrinsic_string_compare(ptr, ptr)
declare i64 @intrinsic_copy_file(ptr, ptr)
declare ptr @intrinsic_get_home_dir()
declare i64 @cli_getenv(i64)
declare i64 @"env_get"(i64)
declare i64 @file_read(i64)
declare void @file_write(i64, i64)
declare i64 @remove_path(i64)
declare i64 @f64_parse(ptr)
declare i64 @"make_sx_string"(i64)
; SLM native bindings
declare i64 @"slm_native_load"(i64, i64, i64)
declare i64 @"slm_native_unload"(i64)
declare i64 @"slm_native_create_context"(i64, i64)
declare i64 @"slm_native_destroy_context"(i64)
declare i64 @"slm_native_tokenize"(i64, i64)
declare i64 @"slm_native_infer"(i64, i64, i64)
declare i64 @"slm_native_generate"(i64, i64, i64, i64)
declare i64 @"slm_native_embed"(i64, i64)
declare i64 @"slm_native_similarity"(i64, i64)
declare i64 @"slm_native_context_size"(i64)
declare i64 @"slm_native_embedding_size"(i64)
declare i64 @"slm_native_get_model_info"(i64)
; Generator intrinsics
declare i64 @generator_yield(i64)
declare i64 @generator_new(i64)
declare i64 @generator_next(i64)
declare i64 @generator_done(i64)
; Belief guard intrinsics
declare i64 @belief_guard_get_confidence(i64)
declare i64 @belief_guard_get_derivative(i64)
declare i64 @belief_register(i64, double, double)
declare i64 @belief_update(i64, double)
declare i64 @belief_update_dual(i64, double, double)
declare double @belief_get_value(i64)
declare i64 @belief_register_i64(i64, i64, i64)
declare i64 @belief_update_i64(i64, i64)
declare i64 @belief_update_dual_i64(i64, i64, i64)
; Belief suspend/wake intrinsics
declare i64 @belief_suspend_receive(i64, i64, i64, i64, i64, double, i64, i64)
declare i64 @belief_cancel_suspend(i64)
declare i64 @belief_suspended_count()
declare i64 @belief_get_actor_suspends(i64)
declare i64 @belief_clear_actor_suspends(i64)
declare i64 @belief_suspend_get_belief(i64)
declare i64 @belief_suspend_get_actor(i64)
declare i64 @belief_suspend_get_duration_ms(i64)
declare i64 @future_poll(i64)
declare i64 @future_ready(i64)
declare i64 @future_pending()
declare i64 @executor_run(i64)
declare i64 @executor_spawn(i64)
declare i64 @block_on(i64)
declare i64 @async_join(i64, i64)
declare i64 @join_result1(i64)
declare i64 @join_result2(i64)
declare i64 @async_select(i64, i64)
declare i64 @select_result(i64)
declare i64 @select_which(i64)
declare i64 @async_timeout(i64, i64)
declare i64 @timeout_result(i64)
declare i64 @timeout_expired(i64)
declare i64 @time_now_ms()
declare i64 @pin_new(i64, i64)
declare i64 @pin_new_uninit(i64)
declare i64 @pin_get(i64)
declare i64 @pin_get_mut(i64)
declare i64 @pin_is_pinned(i64)
declare void @pin_ref(i64)
declare void @pin_unref(i64)
declare void @pin_set_self_ref(i64, i64)
declare i64 @pin_check_self_ref(i64, i64)
declare i64 @intrinsic_call0(i64)
declare i64 @intrinsic_call1(i64, i64)
declare i64 @intrinsic_call2(i64, i64, i64)
declare i64 @intrinsic_call3(i64, i64, i64, i64)
declare i64 @scope_new()
declare i64 @scope_spawn(i64, i64)
declare i64 @scope_poll(i64)
declare i64 @scope_join(i64)
declare i64 @scope_get_result(i64, i64)
declare void @scope_cancel(i64)
declare i64 @scope_count(i64)
declare i64 @scope_completed(i64)
declare void @scope_free(i64)
declare i64 @nursery_run(i64, i64)
declare i64 @actor_get_status(i64)
declare i64 @actor_get_exit_reason(i64)
declare i64 @actor_get_error_code(i64)
declare void @actor_set_error(i64, i64, i64)
declare void @actor_stop(i64)
declare void @actor_kill(i64)
declare void @actor_crash(i64, i64, i64)
declare void @actor_set_on_error(i64, i64)
declare void @actor_set_on_exit(i64, i64)
declare void @actor_set_supervisor(i64, i64)
declare i64 @actor_get_supervisor(i64)
declare i64 @actor_get_restart_count(i64)
declare void @actor_increment_restart(i64)
declare i64 @actor_is_alive(i64)
declare i64 @circuit_breaker_new(i64, i64, i64)
declare i64 @circuit_breaker_allow(i64)
declare void @circuit_breaker_success(i64)
declare void @circuit_breaker_failure(i64)
declare i64 @circuit_breaker_state(i64)
declare void @circuit_breaker_reset(i64)
declare i64 @retry_policy_new(i64, i64, i64, i64)
declare void @retry_policy_set_jitter(i64, i64)
declare i64 @retry_policy_should_retry(i64)
declare i64 @retry_policy_next_delay(i64)
declare void @retry_policy_reset(i64)
declare i64 @retry_policy_count(i64)
declare i64 @actor_link(i64, i64)
declare void @actor_unlink(i64, i64)
declare i64 @actor_monitor(i64, i64)
declare void @actor_demonitor(i64)
declare void @actor_propagate_exit(i64, i64)
declare i64 @actor_is_linked(i64, i64)
declare i64 @actor_spawn_link(i64, i64, i64)
declare i64 @actor_get_links_count(i64)
declare i64 @actor_send_down(i64, i64, i64)
; Phase 23.1: Supervision Trees
declare i64 @supervisor_new(i64, i64, i64)
declare i64 @supervisor_add_child(i64, i64, i64, i64, i64)
declare i64 @supervisor_start(i64)
declare void @supervisor_stop(i64)
declare i64 @supervisor_handle_exit(i64, i64, i64)
declare i64 @supervisor_child_count(i64)
declare i64 @supervisor_child_status(i64, i64)
declare i64 @supervisor_child_handle(i64, i64)
declare void @supervisor_free(i64)
declare i64 @strategy_one_for_one()
declare i64 @strategy_one_for_all()
declare i64 @strategy_rest_for_one()
declare i64 @child_permanent()
declare i64 @child_temporary()
declare i64 @child_transient()
; Phase 23.2: Work-Stealing Scheduler
declare i64 @scheduler_new(i64)
declare i64 @scheduler_start(i64)
declare i64 @scheduler_submit(i64, i64, i64)
declare i64 @scheduler_submit_local(i64, i64, i64, i64)
declare void @scheduler_stop(i64)
declare void @scheduler_free(i64)
declare i64 @scheduler_worker_count(i64)
declare i64 @scheduler_queue_size(i64)
declare i64 @scheduler_worker_idle(i64, i64)
; Phase 23.3: Lock-Free Mailbox
declare i64 @mailbox_new(i64)
declare i64 @mailbox_send(i64, i64)
declare i64 @mailbox_ask(i64, i64)
declare i64 @mailbox_recv(i64)
declare i64 @mailbox_try_recv(i64)
declare i64 @mailbox_size(i64)
declare i64 @mailbox_empty(i64)
declare i64 @mailbox_full(i64)
declare void @mailbox_close(i64)
declare i64 @mailbox_is_closed(i64)
declare void @mailbox_free(i64)
; Phase 23.6: Actor Discovery and Registry
declare i64 @registry_register(i64, i64)
declare void @registry_unregister(i64)
declare i64 @registry_lookup(i64)
declare i64 @registry_count()
declare i64 @registry_set_metadata(i64, i64)
declare i64 @registry_get_metadata(i64)
; Phase 23.7: Backpressure and Flow Control
declare i64 @flow_controller_new(i64, i64, i64)
declare i64 @flow_check(i64)
declare i64 @flow_acquire(i64)
declare void @flow_release(i64)
declare i64 @flow_is_signaling(i64)
declare i64 @flow_current(i64)
declare i64 @flow_high_watermark(i64)
declare i64 @flow_low_watermark(i64)
declare void @flow_reset(i64)
declare void @flow_free(i64)
declare i64 @flow_mode_drop()
declare i64 @flow_mode_block()
declare i64 @flow_mode_signal()
declare void @intrinsic_exit(i64)
; Phase 1 Stdlib: Option
declare i64 @"option_some"(i64)
declare i64 @"option_none"()
declare i64 @"option_is_some"(i64)
declare i64 @"option_is_none"(i64)
declare i64 @"option_unwrap"(i64)
declare i64 @"option_expect"(i64, i64)
declare i64 @"option_unwrap_or"(i64, i64)
declare i64 @"option_map"(i64, i64)
; Phase 1 Stdlib: Result
declare i64 @"result_ok"(i64)
declare i64 @"result_err"(i64)
declare i64 @"result_is_ok"(i64)
declare i64 @"result_is_err"(i64)
declare i64 @"result_unwrap"(i64)
declare i64 @"result_unwrap_err"(i64)
declare i64 @"result_unwrap_or"(i64, i64)
declare i64 @"result_ok_or"(i64, i64)
; Phase 1 Stdlib: Vec extensions
declare i64 @"vec_sum"(i64)
declare i64 @"vec_find"(i64, i64)
declare i64 @"vec_contains"(i64, i64)
declare i64 @"vec_reverse"(i64)
declare i64 @"vec_clone"(i64)
declare i64 @"vec_first"(i64)
declare i64 @"vec_last"(i64)
declare i64 @"vec_pop"(i64)
declare i64 @"vec_set"(i64, i64, i64)
declare i64 @"vec_clear"(i64)
declare i64 @"vec_remove"(i64, i64)
; Phase 1 Stdlib: HashMap
declare i64 @"hashmap_new"()
declare i64 @"hashmap_insert"(i64, i64, i64)
declare i64 @"hashmap_get"(i64, i64)
declare i64 @"hashmap_remove"(i64, i64)
declare i64 @"hashmap_contains"(i64, i64)
declare i64 @"hashmap_len"(i64)
declare i64 @"hashmap_clear"(i64)
declare i64 @"hashmap_keys"(i64)
declare i64 @"hashmap_values"(i64)
; Phase 1 Stdlib: HashSet
declare i64 @"hashset_new"()
declare i64 @"hashset_insert"(i64, i64)
declare i64 @"hashset_remove"(i64, i64)
declare i64 @"hashset_contains"(i64, i64)
declare i64 @"hashset_len"(i64)
declare i64 @"hashset_clear"(i64)
; Phase 1 Stdlib: JSON
declare i64 @"json_parse_simple"(i64)
declare i64 @"json_stringify"(i64)
declare i64 @"json_get_sx"(i64, i64)
declare i64 @"json_keys"(i64)
declare i64 @"json_is_string"(i64)
declare i64 @"json_is_object"(i64)
declare i64 @"json_is_array"(i64)
declare i64 @"json_as_string"(i64)
declare i64 @"json_as_array"(i64)
declare i64 @"json_object_new"()
declare i64 @"json_array_new"()
declare i64 @"json_object_set"(i64, i64, i64)
declare i64 @"json_array_push"(i64, i64)
declare i64 @"json_string"(i64)
declare i64 @"json_string_sx"(i64)
declare i64 @"json_array_len"(i64)
declare i64 @"json_object_len"(i64)
declare i64 @"json_as_i64"(i64)
declare i64 @"json_get_index"(i64, i64)
declare i64 @"json_is_null"(i64)
declare i64 @"json_object_key_at"(i64, i64)
declare i64 @"json_object_value_at"(i64, i64)
declare i64 @"json_object_set_sx"(i64, i64, i64)
; Phase 3: HTTP Client/Server
declare i64 @"http_request_new"(i64, i64)
declare i64 @"http_request_header"(i64, i64, i64)
declare i64 @"http_request_body"(i64, i64)
declare i64 @"http_request_send"(i64)
declare i64 @"http_request_free"(i64)
declare i64 @"http_response_status"(i64)
declare i64 @"http_response_body"(i64)
declare i64 @"http_response_header"(i64, i64)
declare i64 @"http_response_free"(i64)
declare i64 @"http_server_new"(i64)
declare i64 @"http_server_route"(i64, i64, i64, i64)
declare i64 @"http_server_start"(i64)
declare i64 @"http_server_stop"(i64)
declare i64 @"http_server_free"(i64)
; Phase 3: SQL Database
declare i64 @"sql_open"(i64)
declare void @"sql_close"(i64)
declare i64 @"sql_exec"(i64, i64)
declare i64 @"sql_query"(i64, i64)
declare i64 @"sql_prepare"(i64, i64)
declare i64 @"sql_bind_int"(i64, i64, i64)
declare i64 @"sql_bind_text"(i64, i64, i64)
declare i64 @"sql_bind_float"(i64, i64, double)
declare i64 @"sql_bind_null"(i64, i64)
declare i64 @"sql_bind_blob"(i64, i64, i64, i64)
declare i64 @"sql_step"(i64)
declare i64 @"sql_column_int"(i64, i64)
declare i64 @"sql_column_text"(i64, i64)
declare double @"sql_column_float"(i64, i64)
declare i64 @"sql_column_blob"(i64, i64)
declare i64 @"sql_column_blob_len"(i64, i64)
declare i64 @"sql_column_is_null"(i64, i64)
declare void @"sql_finalize"(i64)
declare i64 @"sql_begin"(i64)
declare i64 @"sql_commit"(i64)
declare i64 @"sql_rollback"(i64)
declare i64 @"sql_last_insert_id"(i64)
; Phase 3: UUID
declare i64 @"uuid_v4"()
declare i64 @"uuid_nil"()
declare i64 @"uuid_is_nil"(i64)
declare i64 @"uuid_is_valid"(i64)
; Phase 3: TOML
declare i64 @"toml_parse"(i64)
declare i64 @"toml_get"(i64, i64)
declare i64 @"toml_get_string"(i64, i64)
declare i64 @"toml_get_int"(i64, i64)
declare double @"toml_get_float"(i64, i64)
declare i64 @"toml_get_bool"(i64, i64)
declare i64 @"toml_get_array"(i64, i64)
declare i64 @"toml_get_table"(i64, i64)
declare i64 @"toml_set_string"(i64, i64, i64)
declare i64 @"toml_set_int"(i64, i64, i64)
declare i64 @"toml_set_float"(i64, i64, double)
declare i64 @"toml_set_bool"(i64, i64, i64)
declare i64 @"toml_stringify"(i64)
declare i64 @"toml_table_new"()
declare i64 @"toml_free"(i64)
; Phase G: AI Features
declare i64 @model_infer(i64)
declare i64 @model_load(i64)
declare i64 @model_embed(i64, i64)
declare i64 @model_classify(i64, i64)
declare void @model_unload(i64)
; AI Vector Operations
declare i64 @vector_new(i64, i64)
declare i64 @vector_len(i64)
declare double @vector_get(i64, i64)
declare void @vector_set(i64, i64, double)
declare double @vector_dot(i64, i64)
declare i64 @vector_add(i64, i64)
declare i64 @vector_sub(i64, i64)
declare i64 @vector_scale(i64, double)
declare double @vector_norm(i64)
declare i64 @vector_normalize(i64)
declare double @vector_cosine_similarity(i64, i64)
; AI Tensor Operations
declare i64 @tensor_new(i64, i64)
declare i64 @tensor_shape(i64)
declare i64 @tensor_rank(i64)
declare double @tensor_get(i64, i64)
declare void @tensor_set(i64, i64, double)
declare i64 @tensor_matmul(i64, i64)
declare i64 @tensor_add(i64, i64)
declare i64 @tensor_transpose(i64)
declare i64 @tensor_reshape(i64, i64)
; Specialist Operations
declare i64 @specialist_query(i64, i64)
declare i64 @specialist_stream(i64, i64)
declare void @specialist_set_context(i64, i64)
declare i64 @specialist_get_context(i64)
; Hive Operations
declare i64 @hive_route(i64, i64)
declare void @hive_add_specialist(i64, i64)
declare void @hive_remove_specialist(i64, i64)
declare i64 @hive_consensus(i64, i64)
declare i64 @"sx_int_to_f64"(i64)
declare i64 @"sx_f64_to_int"(i64)
declare i64 @"sx_f64_add"(i64, i64)
declare i64 @"sx_f64_sub"(i64, i64)
declare i64 @"sx_f64_mul"(i64, i64)
declare i64 @"sx_f64_div"(i64, i64)
declare i64 @"sx_f64_mod"(i64, i64)
declare i64 @"sx_f64_gt"(i64, i64)
declare i64 @"sx_f64_lt"(i64, i64)
declare i64 @"sx_f64_ge"(i64, i64)
declare i64 @"sx_f64_le"(i64, i64)
declare i64 @"sx_f64_eq"(i64, i64)
declare i64 @"sx_f64_ne"(i64, i64)
declare i64 @"f64_neg"(i64)
declare i64 @"json_parse"(i64)
declare i64 @"json_get"(i64, i64)
declare i64 @"json_set"(i64, i64, i64)
declare i64 @"string_from"(i64)
declare i64 @"infer"(i64, i64)
declare i64 @"path_exists"(i64)
declare i64 @"tanh_f64"(i64)
declare i64 @"contract_result_violation_type"(i64)
declare i64 @"activation_record"(i64, i64)
declare i64 @"neural_reset_pruning"()
declare i64 @"device_type"(i64)
declare i64 @"lazy_branch_count"(i64)
declare i64 @"lazy_context_new"()
declare i64 @"lazy_context_free"(i64)
declare i64 @"lazy_dominant_branch"(i64)
declare i64 @"lazy_executed_count"(i64)
declare i64 @"lazy_mark_executed"(i64, i64)
declare i64 @"lazy_should_execute"(i64, i64)
declare i64 @"activation_tracker_init"()
declare i64 @"activation_tracking_enabled"()
declare i64 @"neural_gate_new"(i64, i64, i64, i64)
declare i64 @"neural_gate_with_contract"(i64, i64, i64, i64, i64)
declare i64 @"neural_gate_execute_on_device"(i64, i64, i64)
declare i64 @"gate_bind_device"(i64, i64)
declare i64 @"gate_get_device"(i64)
declare i64 @"gate_has_explicit_binding"(i64)
declare i64 @"dead_path_analyzer_new"()
declare i64 @"dead_path_analyzer_free"(i64)
declare i64 @"dead_path_add_edge"(i64, i64, i64)
declare i64 @"dead_path_mark_entry"(i64, i64)
declare i64 @"dead_path_propagate"(i64)
declare i64 @"dead_path_reachable_count"(i64)
declare i64 @"graph_new"()
declare i64 @"graph_free"(i64)
declare i64 @"graph_add_node"(i64, i64)
declare i64 @"graph_add_edge"(i64, i64, i64)
declare i64 @"graph_partition"(i64, i64)
declare i64 @"graph_partition_count"(i64)
declare i64 @"graph_partition_device"(i64, i64)
declare i64 @"pruning_context_new"()
declare i64 @"pruning_context_free"(i64)
declare i64 @"pruning_add_gate"(i64, i64, i64)
declare i64 @"pruning_execute"(i64)
declare i64 @"pruning_is_pruned"(i64, i64)
declare i64 @"pruning_ratio"(i64)
declare i64 @"pruning_reason"(i64, i64)
declare i64 @"pruning_total_count"(i64)
declare i64 @"structured_pruner_new"()
declare i64 @"structured_pruner_free"(i64)
declare i64 @"speculative_context_new"()
declare i64 @"speculative_context_free"(i64)
declare i64 @"speculative_add_branch"(i64, i64, i64)
declare i64 @"speculative_get_result"(i64, i64)
declare i64 @"speculative_set_result"(i64, i64, i64)
declare i64 @"speculative_weighted_result"(i64)
declare i64 @"speculative_memory_used"(i64)
declare i64 @"speculative_gc"(i64)
declare i64 @"optimization_stats_calculate"(i64, i64)
declare i64 @"optimization_stats_free"(i64)
declare i64 @"optimization_speedup"(i64)
declare i64 @"optimization_size_reduction"(i64)
declare i64 @"dual_variable"(i64)
declare i64 @"dual_constant"(i64)
declare i64 @"dual_add"(i64, i64)
declare i64 @"dual_mul"(i64, i64)
declare i64 @"dual_div"(i64, i64)
declare i64 @"dual_mul_scalar"(i64, i64)
declare i64 @"dual_sin"(i64)
declare i64 @"dual_cos"(i64)
declare i64 @"dual_exp"(i64)
declare i64 @"dual_ln"(i64)
declare i64 @"dual_sqrt"(i64)
declare i64 @"dual_tanh"(i64)
declare i64 @"dual_sigmoid"(i64)
declare i64 @"dual_powi"(i64, i64)
declare i64 @"int_hashset_new"()
declare i64 @"int_hashset_insert"(i64, i64)
declare i64 @"int_hashset_contains"(i64, i64)
declare i64 @"int_hashset_len"(i64)
declare i64 @"not_approx_eq"(i64, i64, i64)
declare i64 @"transfer_queue_init"(i64)
declare i64 @"sxiter_from_vec"(i64)
declare i64 @"sxiter_collect_vec"(i64)
declare i64 @"sxiter_filter"(i64, i64)
declare i64 @"wref_registry_init"()
declare i64 @"wref_new"(i64, i64, i64)
declare i64 @"wref_ptr"(i64)
declare i64 @"wref_weight"(i64)
declare i64 @"wref_count"()
declare i64 @"wref_state"(i64)
declare i64 @"wref_retain"(i64)
declare i64 @"wref_release"(i64)
declare i64 @"wref_is_allocated"(i64)
declare i64 @"wref_collapse"(i64)
declare i64 @"wref_set_weight"(i64, i64)
declare i64 @"wref_set_mode"(i64)
declare i64 @"wref_get_mode"()
declare i64 @"wref_set_weight_threshold"(i64)
declare i64 @"wref_get_weight_threshold"()
declare i64 @"wref_gc"()
declare i64 @"wref_gc_total_runs"()
declare i64 @"wref_gc_total_collected"()
declare i64 @"wref_gc_last_collected"()
declare i64 @"wref_bytes_allocated"()
declare i64 @"device_registry_init"()
declare i64 @"contract_violation_count"()
declare i64 @"contract_set_violation_handler"(i64)
declare i64 @"neural_gate_weight"(i64)
declare i64 @"lazy_eval"(i64)
declare i64 @"lazy_best_branch"(i64)
declare i64 @"print_f64"(i64)
declare i64 @"device_register"(i64, i64, i64, i64, i64, i64)
declare i64 @"lazy_add_branch"(i64, i64)
declare i64 @"contract_result_satisfied"(i64)
declare i64 @"neural_set_temperature"(i64)
declare i64 @"activation_rate_get"(i64)
declare i64 @"neural_register_gate_weight"(i64, i64, i64)
declare i64 @"ckpt_context_fork"(i64)
declare i64 @"ckpt_context_merge"(i64, i64)
declare i64 @"sqrt_f64"(i64)
declare i64 @"ckpt_save"(i64)
declare i64 @"contract_result_ok"()
declare i64 @"neural_get_temperature"()
declare i64 @"activation_mean_get"(i64)
declare i64 @"neural_prune_by_weight_magnitude"(i64)
declare i64 @"activation_gate_count"()
declare i64 @"ckpt_restore"(i64)
declare i64 @"contract_result_new"(i64, i64)
declare i64 @"contract_result_free"(i64)
declare i64 @"device_get_default"()
declare i64 @"grad_tape_temperature"(i64)
declare i64 @"json_object_has"(i64, i64)
declare i64 @"neural_is_gate_pruned"(i64)
declare i64 @"ln_f64"(i64)
declare i64 @"device_get"(i64)
declare i64 @"ckpt_count"()
declare i64 @"contract_in_range"(i64, i64, i64)
declare i64 @"grad_tape_set_training"(i64, i64)
declare i64 @"activation_epoch_current"()
declare i64 @"neural_get_pruned_gate_count"()
declare i64 @"exp_f64"(i64)
declare i64 @"sin_f64"(i64)
declare i64 @"json_is_number"(i64)
declare i64 @"string_to_lowercase"(i64)
declare i64 @"string_split_whitespace"(i64)
declare i64 @"device_count"()
declare i64 @"ckpt_context_new"()
declare i64 @"ckpt_context_free"(i64)
declare i64 @"ckpt_context_save"(i64)
declare i64 @"ckpt_context_restore"(i64)
declare i64 @"contract_get_panic_mode"()
declare i64 @"contract_set_panic_mode"(i64)
declare i64 @"grad_tape_set_temperature"(i64, i64)
declare i64 @"activation_epoch_advance"(i64)
declare i64 @"neural_get_gate_count"()
declare i64 @"json_is_bool"(i64)
; v0.13.0 Runtime
declare i64 @"print_string"(i64)
declare i64 @"file_delete"(i64)
declare i64 @"cos_f64"(i64)
declare i64 @"pow_f64"(i64, i64)
declare i64 @"neural_set_training_mode"(i64)
declare i64 @"neural_get_training_mode"()
declare i64 @"neural_sigmoid"(i64)
declare i64 @"neural_register_gate"(i64)
declare i64 @"neural_clear_gate_registry"()
declare i64 @"neural_gate_count"()
declare i64 @"grad_tape_new"()
declare i64 @"grad_tape_free"(i64)
declare i64 @"grad_tape_len"(i64)
declare i64 @"grad_tape_record"(i64, i64)
declare i64 @"contract_check_requires"(i64, i64, i64)
declare i64 @"contract_check_ensures"(i64, i64, i64)
declare i64 @"contract_check_invariant"(i64, i64, i64)
declare i64 @"device_available"(i64)
declare i64 @"activation_count_inc"(i64)
declare i64 @"activation_count_get"(i64)
declare i64 @"ckpt_branch_start"()
declare i64 @"ckpt_branch_end"(i64)
declare i64 @"anneal_exponential"(i64, i64)
declare i64 @"anneal_linear"(i64, i64)
declare i64 @"json_null"()
declare i64 @"json_bool"(i64)
declare i64 @"json_number_i64"(i64)
declare i64 @"json_number_f64"(i64)
declare i64 @"json_array"()
declare i64 @"json_object"()
declare i64 @"json_as_bool"(i64)
declare i64 @"HashMap_new"()
declare i64 @"hashmap_is_empty"(i64)
declare i64 @"timer_start"()
declare i64 @"timer_elapsed_us"(i64)
declare i64 @"timer_elapsed_ms"(i64)
declare i64 @"timer_elapsed_s"(i64)
declare i64 @"timer_close"(i64)
declare i64 @"timer_record_to"(i64, i64)
declare i64 @"logger_new"()
declare i64 @"logger_global"()
declare i64 @"logger_set_level"(i64, i64)
declare i64 @"logger_set_console"(i64, i64)
declare i64 @"logger_set_file"(i64, i64)
declare i64 @"logger_set_json"(i64, i64)
declare i64 @"logger_add_context"(i64, i64, i64)
declare i64 @"logger_close"(i64)
declare i64 @"log_debug"(i64)
declare i64 @"log_info"(i64)
declare i64 @"log_warn"(i64)
declare i64 @"log_error"(i64)
declare i64 @"log_fatal"(i64)
declare i64 @"log_with_field"(i64, i64, i64)
declare i64 @"log_with_span"(i64, i64)
declare i64 @"counter_new"(i64)
declare i64 @"counter_inc"(i64)
declare i64 @"counter_add"(i64, i64)
declare i64 @"counter_add_label"(i64, i64, i64)
declare i64 @"counter_value"(i64)
declare i64 @"gauge_new"(i64)
declare i64 @"gauge_set"(i64, i64)
declare i64 @"gauge_inc"(i64)
declare i64 @"gauge_dec"(i64)
declare i64 @"gauge_add"(i64, i64)
declare i64 @"gauge_value"(i64)
declare i64 @"histogram_new"(i64)
declare i64 @"histogram_observe"(i64, i64)
declare i64 @"histogram_count"(i64)
declare i64 @"histogram_sum"(i64)
declare i64 @"histogram_mean"(i64)
declare i64 @"histogram_min"(i64)
declare i64 @"histogram_max"(i64)
declare i64 @"histogram_to_json"(i64)
declare i64 @"metrics_registry_new"()
declare i64 @"metrics_registry_global"()
declare i64 @"metrics_registry_count"(i64)
declare i64 @"metrics_registry_close"(i64)
declare i64 @"metrics_export_json"(i64)
declare i64 @"metrics_export_prometheus"(i64)
declare i64 @"span_start"(i64)
declare i64 @"span_start_child"(i64, i64)
declare i64 @"span_end"(i64)
declare i64 @"span_close"(i64)
declare i64 @"span_id"(i64)
declare i64 @"span_trace_id"(i64)
declare i64 @"span_duration_us"(i64)
declare i64 @"span_set_attribute"(i64, i64, i64)
declare i64 @"span_set_status"(i64, i64)
declare i64 @"span_add_event"(i64, i64)
declare i64 @"span_to_json"(i64)
declare i64 @"tracer_new"()
declare i64 @"tracer_active_spans"(i64)
declare i64 @"tracer_close"(i64)

define i64 @"abs_f64"(i64 %x) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t0 = load i64, ptr %local.x
  %t1 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"clamp"(i64 %x, i64 %lo, i64 %hi) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %local.lo = alloca i64
  store i64 %lo, ptr %local.lo
  %local.hi = alloca i64
  store i64 %hi, ptr %local.hi
  %t9 = load i64, ptr %local.x
  %t10 = load i64, ptr %local.lo
  %t11 = call i64 @"sx_f64_lt"(i64 %t9, i64 %t10)
  %t12 = icmp ne i64 %t11, 0
  br i1 %t12, label %then1, label %else1
then1:
  %t13 = load i64, ptr %local.lo
  ret i64 %t13
else1:
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t14 = phi i64 [ 0, %else1_end ]
  %t15 = load i64, ptr %local.x
  %t16 = load i64, ptr %local.hi
  %t17 = call i64 @"sx_f64_gt"(i64 %t15, i64 %t16)
  %t18 = icmp ne i64 %t17, 0
  br i1 %t18, label %then2, label %else2
then2:
  %t19 = load i64, ptr %local.hi
  ret i64 %t19
else2:
  br label %else2_end
else2_end:
  br label %endif2
endif2:
  %t20 = phi i64 [ 0, %else2_end ]
  %t21 = load i64, ptr %local.x
  ret i64 %t21
}

define i64 @"is_step_multiple"(i64 %step, i64 %k) nounwind {
entry:
  %local.mod_check.22 = alloca i64
  %local.step = alloca i64
  store i64 %step, ptr %local.step
  %local.k = alloca i64
  store i64 %k, ptr %local.k
  %t23 = load i64, ptr %local.step
  %t24 = load i64, ptr %local.step
  %t25 = load i64, ptr %local.k
  %t26 = sdiv i64 %t24, %t25
  %t27 = load i64, ptr %local.k
  %t28 = mul i64 %t26, %t27
  %t29 = sub i64 %t23, %t28
  store i64 %t29, ptr %local.mod_check.22
  %t30 = load i64, ptr %local.mod_check.22
  %t31 = icmp eq i64 %t30, 0
  %t32 = zext i1 %t31 to i64
  %t33 = icmp ne i64 %t32, 0
  br i1 %t33, label %then3, label %else3
then3:
  br label %then3_end
then3_end:
  br label %endif3
else3:
  br label %else3_end
else3_end:
  br label %endif3
endif3:
  %t34 = phi i64 [ 1, %then3_end ], [ 0, %else3_end ]
  ret i64 %t34
}

define i64 @"dot4"(i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %b0, i64 %b1, i64 %b2, i64 %b3) nounwind {
entry:
  %local.a0 = alloca i64
  store i64 %a0, ptr %local.a0
  %local.a1 = alloca i64
  store i64 %a1, ptr %local.a1
  %local.a2 = alloca i64
  store i64 %a2, ptr %local.a2
  %local.a3 = alloca i64
  store i64 %a3, ptr %local.a3
  %local.b0 = alloca i64
  store i64 %b0, ptr %local.b0
  %local.b1 = alloca i64
  store i64 %b1, ptr %local.b1
  %local.b2 = alloca i64
  store i64 %b2, ptr %local.b2
  %local.b3 = alloca i64
  store i64 %b3, ptr %local.b3
  %t35 = load i64, ptr %local.a0
  %t36 = load i64, ptr %local.b0
  %t37 = call i64 @"sx_f64_mul"(i64 %t35, i64 %t36)
  %t38 = load i64, ptr %local.a1
  %t39 = load i64, ptr %local.b1
  %t40 = call i64 @"sx_f64_mul"(i64 %t38, i64 %t39)
  %t41 = call i64 @"sx_f64_add"(i64 %t37, i64 %t40)
  %t42 = load i64, ptr %local.a2
  %t43 = load i64, ptr %local.b2
  %t44 = call i64 @"sx_f64_mul"(i64 %t42, i64 %t43)
  %t45 = call i64 @"sx_f64_add"(i64 %t41, i64 %t44)
  %t46 = load i64, ptr %local.a3
  %t47 = load i64, ptr %local.b3
  %t48 = call i64 @"sx_f64_mul"(i64 %t46, i64 %t47)
  %t49 = call i64 @"sx_f64_add"(i64 %t45, i64 %t48)
  ret i64 %t49
}

define i64 @"norm4"(i64 %a0, i64 %a1, i64 %a2, i64 %a3) nounwind {
entry:
  %local.a0 = alloca i64
  store i64 %a0, ptr %local.a0
  %local.a1 = alloca i64
  store i64 %a1, ptr %local.a1
  %local.a2 = alloca i64
  store i64 %a2, ptr %local.a2
  %local.a3 = alloca i64
  store i64 %a3, ptr %local.a3
  %t50 = load i64, ptr %local.a0
  %t51 = load i64, ptr %local.a1
  %t52 = load i64, ptr %local.a2
  %t53 = load i64, ptr %local.a3
  %t54 = load i64, ptr %local.a0
  %t55 = load i64, ptr %local.a1
  %t56 = load i64, ptr %local.a2
  %t57 = load i64, ptr %local.a3
  %t58 = call i64 @"dot4"(i64 %t50, i64 %t51, i64 %t52, i64 %t53, i64 %t54, i64 %t55, i64 %t56, i64 %t57)
  %t59 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.2)
  %t60 = call i64 @"sx_f64_add"(i64 %t58, i64 %t59)
  %t61 = call i64 @"sqrt_f64"(i64 %t60)
  ret i64 %t61
}

define i64 @"loss_liquid"(i64 %w0, i64 %w1, i64 %w2, i64 %w3) nounwind {
entry:
  %local.d0.62 = alloca i64
  %local.d1.63 = alloca i64
  %local.d2.64 = alloca i64
  %local.d3.65 = alloca i64
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %t66 = load i64, ptr %local.w0
  %t67 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.3)
  %t68 = call i64 @"sx_f64_sub"(i64 %t66, i64 %t67)
  %t69 = load i64, ptr %local.w0
  %t70 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.4)
  %t71 = call i64 @"sx_f64_sub"(i64 %t69, i64 %t70)
  %t72 = call i64 @"sx_f64_mul"(i64 %t68, i64 %t71)
  store i64 %t72, ptr %local.d0.62
  %t73 = load i64, ptr %local.w1
  %t74 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.5)
  %t75 = call i64 @"sx_f64_sub"(i64 %t73, i64 %t74)
  %t76 = load i64, ptr %local.w1
  %t77 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.6)
  %t78 = call i64 @"sx_f64_sub"(i64 %t76, i64 %t77)
  %t79 = call i64 @"sx_f64_mul"(i64 %t75, i64 %t78)
  store i64 %t79, ptr %local.d1.63
  %t80 = load i64, ptr %local.w2
  %t81 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.7)
  %t82 = call i64 @"sx_f64_add"(i64 %t80, i64 %t81)
  %t83 = load i64, ptr %local.w2
  %t84 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.8)
  %t85 = call i64 @"sx_f64_add"(i64 %t83, i64 %t84)
  %t86 = call i64 @"sx_f64_mul"(i64 %t82, i64 %t85)
  store i64 %t86, ptr %local.d2.64
  %t87 = load i64, ptr %local.w3
  %t88 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.9)
  %t89 = call i64 @"sx_f64_sub"(i64 %t87, i64 %t88)
  %t90 = load i64, ptr %local.w3
  %t91 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.10)
  %t92 = call i64 @"sx_f64_sub"(i64 %t90, i64 %t91)
  %t93 = call i64 @"sx_f64_mul"(i64 %t89, i64 %t92)
  store i64 %t93, ptr %local.d3.65
  %t94 = load i64, ptr %local.d0.62
  %t95 = load i64, ptr %local.d1.63
  %t96 = call i64 @"sx_f64_add"(i64 %t94, i64 %t95)
  %t97 = load i64, ptr %local.d2.64
  %t98 = call i64 @"sx_f64_add"(i64 %t96, i64 %t97)
  %t99 = load i64, ptr %local.d3.65
  %t100 = call i64 @"sx_f64_add"(i64 %t98, i64 %t99)
  ret i64 %t100
}

define i64 @"loss_lora"(i64 %w0, i64 %w1, i64 %w2, i64 %w3) nounwind {
entry:
  %local.d0.101 = alloca i64
  %local.d1.102 = alloca i64
  %local.d2.103 = alloca i64
  %local.d3.104 = alloca i64
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %t105 = load i64, ptr %local.w0
  %t106 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.11)
  %t107 = call i64 @"sx_f64_add"(i64 %t105, i64 %t106)
  %t108 = load i64, ptr %local.w0
  %t109 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.12)
  %t110 = call i64 @"sx_f64_add"(i64 %t108, i64 %t109)
  %t111 = call i64 @"sx_f64_mul"(i64 %t107, i64 %t110)
  store i64 %t111, ptr %local.d0.101
  %t112 = load i64, ptr %local.w1
  %t113 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.13)
  %t114 = call i64 @"sx_f64_sub"(i64 %t112, i64 %t113)
  %t115 = load i64, ptr %local.w1
  %t116 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.14)
  %t117 = call i64 @"sx_f64_sub"(i64 %t115, i64 %t116)
  %t118 = call i64 @"sx_f64_mul"(i64 %t114, i64 %t117)
  store i64 %t118, ptr %local.d1.102
  %t119 = load i64, ptr %local.w2
  %t120 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.15)
  %t121 = call i64 @"sx_f64_sub"(i64 %t119, i64 %t120)
  %t122 = load i64, ptr %local.w2
  %t123 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.16)
  %t124 = call i64 @"sx_f64_sub"(i64 %t122, i64 %t123)
  %t125 = call i64 @"sx_f64_mul"(i64 %t121, i64 %t124)
  store i64 %t125, ptr %local.d2.103
  %t126 = load i64, ptr %local.w3
  %t127 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.17)
  %t128 = call i64 @"sx_f64_add"(i64 %t126, i64 %t127)
  %t129 = load i64, ptr %local.w3
  %t130 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.18)
  %t131 = call i64 @"sx_f64_add"(i64 %t129, i64 %t130)
  %t132 = call i64 @"sx_f64_mul"(i64 %t128, i64 %t131)
  store i64 %t132, ptr %local.d3.104
  %t133 = load i64, ptr %local.d0.101
  %t134 = load i64, ptr %local.d1.102
  %t135 = call i64 @"sx_f64_add"(i64 %t133, i64 %t134)
  %t136 = load i64, ptr %local.d2.103
  %t137 = call i64 @"sx_f64_add"(i64 %t135, i64 %t136)
  %t138 = load i64, ptr %local.d3.104
  %t139 = call i64 @"sx_f64_add"(i64 %t137, i64 %t138)
  ret i64 %t139
}

define i64 @"loss_belief"(i64 %w0, i64 %w1, i64 %w2, i64 %w3) nounwind {
entry:
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %t140 = load i64, ptr %local.w0
  %t141 = load i64, ptr %local.w0
  %t142 = call i64 @"sx_f64_mul"(i64 %t140, i64 %t141)
  %t143 = load i64, ptr %local.w1
  %t144 = load i64, ptr %local.w1
  %t145 = call i64 @"sx_f64_mul"(i64 %t143, i64 %t144)
  %t146 = call i64 @"sx_f64_add"(i64 %t142, i64 %t145)
  %t147 = load i64, ptr %local.w2
  %t148 = load i64, ptr %local.w2
  %t149 = call i64 @"sx_f64_mul"(i64 %t147, i64 %t148)
  %t150 = call i64 @"sx_f64_add"(i64 %t146, i64 %t149)
  %t151 = load i64, ptr %local.w3
  %t152 = load i64, ptr %local.w3
  %t153 = call i64 @"sx_f64_mul"(i64 %t151, i64 %t152)
  %t154 = call i64 @"sx_f64_add"(i64 %t150, i64 %t153)
  ret i64 %t154
}

define i64 @"loss_memory"(i64 %w0, i64 %w1, i64 %w2, i64 %w3) nounwind {
entry:
  %local.d0.155 = alloca i64
  %local.d1.156 = alloca i64
  %local.d2.157 = alloca i64
  %local.d3.158 = alloca i64
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %t159 = load i64, ptr %local.w0
  %t160 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.19)
  %t161 = call i64 @"sx_f64_sub"(i64 %t159, i64 %t160)
  %t162 = load i64, ptr %local.w0
  %t163 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.20)
  %t164 = call i64 @"sx_f64_sub"(i64 %t162, i64 %t163)
  %t165 = call i64 @"sx_f64_mul"(i64 %t161, i64 %t164)
  store i64 %t165, ptr %local.d0.155
  %t166 = load i64, ptr %local.w1
  %t167 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.21)
  %t168 = call i64 @"sx_f64_add"(i64 %t166, i64 %t167)
  %t169 = load i64, ptr %local.w1
  %t170 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.22)
  %t171 = call i64 @"sx_f64_add"(i64 %t169, i64 %t170)
  %t172 = call i64 @"sx_f64_mul"(i64 %t168, i64 %t171)
  store i64 %t172, ptr %local.d1.156
  %t173 = load i64, ptr %local.w2
  %t174 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.23)
  %t175 = call i64 @"sx_f64_sub"(i64 %t173, i64 %t174)
  %t176 = load i64, ptr %local.w2
  %t177 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.24)
  %t178 = call i64 @"sx_f64_sub"(i64 %t176, i64 %t177)
  %t179 = call i64 @"sx_f64_mul"(i64 %t175, i64 %t178)
  store i64 %t179, ptr %local.d2.157
  %t180 = load i64, ptr %local.w3
  %t181 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.25)
  %t182 = call i64 @"sx_f64_sub"(i64 %t180, i64 %t181)
  %t183 = load i64, ptr %local.w3
  %t184 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.26)
  %t185 = call i64 @"sx_f64_sub"(i64 %t183, i64 %t184)
  %t186 = call i64 @"sx_f64_mul"(i64 %t182, i64 %t185)
  store i64 %t186, ptr %local.d3.158
  %t187 = load i64, ptr %local.d0.155
  %t188 = load i64, ptr %local.d1.156
  %t189 = call i64 @"sx_f64_add"(i64 %t187, i64 %t188)
  %t190 = load i64, ptr %local.d2.157
  %t191 = call i64 @"sx_f64_add"(i64 %t189, i64 %t190)
  %t192 = load i64, ptr %local.d3.158
  %t193 = call i64 @"sx_f64_add"(i64 %t191, i64 %t192)
  ret i64 %t193
}

define i64 @"combined_loss"(i64 %w0, i64 %w1, i64 %w2, i64 %w3) nounwind {
entry:
  %local.ll.194 = alloca i64
  %local.lr.195 = alloca i64
  %local.lb.196 = alloca i64
  %local.lm.197 = alloca i64
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %t198 = load i64, ptr %local.w0
  %t199 = load i64, ptr %local.w1
  %t200 = load i64, ptr %local.w2
  %t201 = load i64, ptr %local.w3
  %t202 = call i64 @"loss_liquid"(i64 %t198, i64 %t199, i64 %t200, i64 %t201)
  store i64 %t202, ptr %local.ll.194
  %t203 = load i64, ptr %local.w0
  %t204 = load i64, ptr %local.w1
  %t205 = load i64, ptr %local.w2
  %t206 = load i64, ptr %local.w3
  %t207 = call i64 @"loss_lora"(i64 %t203, i64 %t204, i64 %t205, i64 %t206)
  store i64 %t207, ptr %local.lr.195
  %t208 = load i64, ptr %local.w0
  %t209 = load i64, ptr %local.w1
  %t210 = load i64, ptr %local.w2
  %t211 = load i64, ptr %local.w3
  %t212 = call i64 @"loss_belief"(i64 %t208, i64 %t209, i64 %t210, i64 %t211)
  store i64 %t212, ptr %local.lb.196
  %t213 = load i64, ptr %local.w0
  %t214 = load i64, ptr %local.w1
  %t215 = load i64, ptr %local.w2
  %t216 = load i64, ptr %local.w3
  %t217 = call i64 @"loss_memory"(i64 %t213, i64 %t214, i64 %t215, i64 %t216)
  store i64 %t217, ptr %local.lm.197
  %t218 = load i64, ptr %local.ll.194
  %t219 = load i64, ptr %local.lr.195
  %t220 = call i64 @"sx_f64_add"(i64 %t218, i64 %t219)
  %t221 = load i64, ptr %local.lb.196
  %t222 = call i64 @"sx_f64_add"(i64 %t220, i64 %t221)
  %t223 = load i64, ptr %local.lm.197
  %t224 = call i64 @"sx_f64_add"(i64 %t222, i64 %t223)
  ret i64 %t224
}

define i64 @"grad_liquid"(i64 %w, i64 %dim) nounwind {
entry:
  %local.w = alloca i64
  store i64 %w, ptr %local.w
  %local.dim = alloca i64
  store i64 %dim, ptr %local.dim
  %t225 = load i64, ptr %local.dim
  %t226 = icmp eq i64 %t225, 0
  %t227 = zext i1 %t226 to i64
  %t228 = icmp ne i64 %t227, 0
  br i1 %t228, label %then4, label %else4
then4:
  %t229 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.27)
  %t230 = load i64, ptr %local.w
  %t231 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.28)
  %t232 = call i64 @"sx_f64_sub"(i64 %t230, i64 %t231)
  %t233 = call i64 @"sx_f64_mul"(i64 %t229, i64 %t232)
  br label %then4_end
then4_end:
  br label %endif4
else4:
  %t234 = load i64, ptr %local.dim
  %t235 = icmp eq i64 %t234, 1
  %t236 = zext i1 %t235 to i64
  %t237 = icmp ne i64 %t236, 0
  br i1 %t237, label %then5, label %else5
then5:
  %t238 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.29)
  %t239 = load i64, ptr %local.w
  %t240 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.30)
  %t241 = call i64 @"sx_f64_sub"(i64 %t239, i64 %t240)
  %t242 = call i64 @"sx_f64_mul"(i64 %t238, i64 %t241)
  br label %then5_end
then5_end:
  br label %endif5
else5:
  %t243 = load i64, ptr %local.dim
  %t244 = icmp eq i64 %t243, 2
  %t245 = zext i1 %t244 to i64
  %t246 = icmp ne i64 %t245, 0
  br i1 %t246, label %then6, label %else6
then6:
  %t247 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.31)
  %t248 = load i64, ptr %local.w
  %t249 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.32)
  %t250 = call i64 @"sx_f64_add"(i64 %t248, i64 %t249)
  %t251 = call i64 @"sx_f64_mul"(i64 %t247, i64 %t250)
  br label %then6_end
then6_end:
  br label %endif6
else6:
  %t252 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.33)
  %t253 = load i64, ptr %local.w
  %t254 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.34)
  %t255 = call i64 @"sx_f64_sub"(i64 %t253, i64 %t254)
  %t256 = call i64 @"sx_f64_mul"(i64 %t252, i64 %t255)
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t257 = phi i64 [ %t251, %then6_end ], [ %t256, %else6_end ]
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t258 = phi i64 [ %t242, %then5_end ], [ %t257, %else5_end ]
  br label %else4_end
else4_end:
  br label %endif4
endif4:
  %t259 = phi i64 [ %t233, %then4_end ], [ %t258, %else4_end ]
  ret i64 %t259
}

define i64 @"grad_lora"(i64 %w, i64 %dim) nounwind {
entry:
  %local.w = alloca i64
  store i64 %w, ptr %local.w
  %local.dim = alloca i64
  store i64 %dim, ptr %local.dim
  %t260 = load i64, ptr %local.dim
  %t261 = icmp eq i64 %t260, 0
  %t262 = zext i1 %t261 to i64
  %t263 = icmp ne i64 %t262, 0
  br i1 %t263, label %then7, label %else7
then7:
  %t264 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.35)
  %t265 = load i64, ptr %local.w
  %t266 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.36)
  %t267 = call i64 @"sx_f64_add"(i64 %t265, i64 %t266)
  %t268 = call i64 @"sx_f64_mul"(i64 %t264, i64 %t267)
  br label %then7_end
then7_end:
  br label %endif7
else7:
  %t269 = load i64, ptr %local.dim
  %t270 = icmp eq i64 %t269, 1
  %t271 = zext i1 %t270 to i64
  %t272 = icmp ne i64 %t271, 0
  br i1 %t272, label %then8, label %else8
then8:
  %t273 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.37)
  %t274 = load i64, ptr %local.w
  %t275 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.38)
  %t276 = call i64 @"sx_f64_sub"(i64 %t274, i64 %t275)
  %t277 = call i64 @"sx_f64_mul"(i64 %t273, i64 %t276)
  br label %then8_end
then8_end:
  br label %endif8
else8:
  %t278 = load i64, ptr %local.dim
  %t279 = icmp eq i64 %t278, 2
  %t280 = zext i1 %t279 to i64
  %t281 = icmp ne i64 %t280, 0
  br i1 %t281, label %then9, label %else9
then9:
  %t282 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.39)
  %t283 = load i64, ptr %local.w
  %t284 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.40)
  %t285 = call i64 @"sx_f64_sub"(i64 %t283, i64 %t284)
  %t286 = call i64 @"sx_f64_mul"(i64 %t282, i64 %t285)
  br label %then9_end
then9_end:
  br label %endif9
else9:
  %t287 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.41)
  %t288 = load i64, ptr %local.w
  %t289 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.42)
  %t290 = call i64 @"sx_f64_add"(i64 %t288, i64 %t289)
  %t291 = call i64 @"sx_f64_mul"(i64 %t287, i64 %t290)
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t292 = phi i64 [ %t286, %then9_end ], [ %t291, %else9_end ]
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t293 = phi i64 [ %t277, %then8_end ], [ %t292, %else8_end ]
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t294 = phi i64 [ %t268, %then7_end ], [ %t293, %else7_end ]
  ret i64 %t294
}

define i64 @"grad_belief"(i64 %w) nounwind {
entry:
  %local.w = alloca i64
  store i64 %w, ptr %local.w
  %t295 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.43)
  %t296 = load i64, ptr %local.w
  %t297 = call i64 @"sx_f64_mul"(i64 %t295, i64 %t296)
  ret i64 %t297
}

define i64 @"grad_memory"(i64 %w, i64 %dim) nounwind {
entry:
  %local.w = alloca i64
  store i64 %w, ptr %local.w
  %local.dim = alloca i64
  store i64 %dim, ptr %local.dim
  %t298 = load i64, ptr %local.dim
  %t299 = icmp eq i64 %t298, 0
  %t300 = zext i1 %t299 to i64
  %t301 = icmp ne i64 %t300, 0
  br i1 %t301, label %then10, label %else10
then10:
  %t302 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.44)
  %t303 = load i64, ptr %local.w
  %t304 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.45)
  %t305 = call i64 @"sx_f64_sub"(i64 %t303, i64 %t304)
  %t306 = call i64 @"sx_f64_mul"(i64 %t302, i64 %t305)
  br label %then10_end
then10_end:
  br label %endif10
else10:
  %t307 = load i64, ptr %local.dim
  %t308 = icmp eq i64 %t307, 1
  %t309 = zext i1 %t308 to i64
  %t310 = icmp ne i64 %t309, 0
  br i1 %t310, label %then11, label %else11
then11:
  %t311 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.46)
  %t312 = load i64, ptr %local.w
  %t313 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.47)
  %t314 = call i64 @"sx_f64_add"(i64 %t312, i64 %t313)
  %t315 = call i64 @"sx_f64_mul"(i64 %t311, i64 %t314)
  br label %then11_end
then11_end:
  br label %endif11
else11:
  %t316 = load i64, ptr %local.dim
  %t317 = icmp eq i64 %t316, 2
  %t318 = zext i1 %t317 to i64
  %t319 = icmp ne i64 %t318, 0
  br i1 %t319, label %then12, label %else12
then12:
  %t320 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.48)
  %t321 = load i64, ptr %local.w
  %t322 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.49)
  %t323 = call i64 @"sx_f64_sub"(i64 %t321, i64 %t322)
  %t324 = call i64 @"sx_f64_mul"(i64 %t320, i64 %t323)
  br label %then12_end
then12_end:
  br label %endif12
else12:
  %t325 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.50)
  %t326 = load i64, ptr %local.w
  %t327 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.51)
  %t328 = call i64 @"sx_f64_sub"(i64 %t326, i64 %t327)
  %t329 = call i64 @"sx_f64_mul"(i64 %t325, i64 %t328)
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t330 = phi i64 [ %t324, %then12_end ], [ %t329, %else12_end ]
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t331 = phi i64 [ %t315, %then11_end ], [ %t330, %else11_end ]
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t332 = phi i64 [ %t306, %then10_end ], [ %t331, %else10_end ]
  ret i64 %t332
}

define i64 @"project_1d"(i64 %gi_d, i64 %gi0, i64 %gi1, i64 %gi2, i64 %gi3, i64 %gj0, i64 %gj1, i64 %gj2, i64 %gj3, i64 %alpha, i64 %dim) nounwind {
entry:
  %local.dot_ij.333 = alloca i64
  %local.gj_sq.334 = alloca i64
  %local.coeff.335 = alloca i64
  %local.gj_d.336 = alloca i64
  %local.gi_d = alloca i64
  store i64 %gi_d, ptr %local.gi_d
  %local.gi0 = alloca i64
  store i64 %gi0, ptr %local.gi0
  %local.gi1 = alloca i64
  store i64 %gi1, ptr %local.gi1
  %local.gi2 = alloca i64
  store i64 %gi2, ptr %local.gi2
  %local.gi3 = alloca i64
  store i64 %gi3, ptr %local.gi3
  %local.gj0 = alloca i64
  store i64 %gj0, ptr %local.gj0
  %local.gj1 = alloca i64
  store i64 %gj1, ptr %local.gj1
  %local.gj2 = alloca i64
  store i64 %gj2, ptr %local.gj2
  %local.gj3 = alloca i64
  store i64 %gj3, ptr %local.gj3
  %local.alpha = alloca i64
  store i64 %alpha, ptr %local.alpha
  %local.dim = alloca i64
  store i64 %dim, ptr %local.dim
  %t337 = load i64, ptr %local.gi0
  %t338 = load i64, ptr %local.gi1
  %t339 = load i64, ptr %local.gi2
  %t340 = load i64, ptr %local.gi3
  %t341 = load i64, ptr %local.gj0
  %t342 = load i64, ptr %local.gj1
  %t343 = load i64, ptr %local.gj2
  %t344 = load i64, ptr %local.gj3
  %t345 = call i64 @"dot4"(i64 %t337, i64 %t338, i64 %t339, i64 %t340, i64 %t341, i64 %t342, i64 %t343, i64 %t344)
  store i64 %t345, ptr %local.dot_ij.333
  %t346 = load i64, ptr %local.dot_ij.333
  %t347 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.52)
  %t348 = call i64 @"sx_f64_ge"(i64 %t346, i64 %t347)
  %t349 = icmp ne i64 %t348, 0
  br i1 %t349, label %then13, label %else13
then13:
  %t350 = load i64, ptr %local.gi_d
  ret i64 %t350
else13:
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t351 = phi i64 [ 0, %else13_end ]
  %t352 = load i64, ptr %local.gj0
  %t353 = load i64, ptr %local.gj1
  %t354 = load i64, ptr %local.gj2
  %t355 = load i64, ptr %local.gj3
  %t356 = load i64, ptr %local.gj0
  %t357 = load i64, ptr %local.gj1
  %t358 = load i64, ptr %local.gj2
  %t359 = load i64, ptr %local.gj3
  %t360 = call i64 @"dot4"(i64 %t352, i64 %t353, i64 %t354, i64 %t355, i64 %t356, i64 %t357, i64 %t358, i64 %t359)
  %t361 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.53)
  %t362 = call i64 @"sx_f64_add"(i64 %t360, i64 %t361)
  store i64 %t362, ptr %local.gj_sq.334
  %t363 = load i64, ptr %local.alpha
  %t364 = load i64, ptr %local.dot_ij.333
  %t365 = call i64 @"sx_f64_mul"(i64 %t363, i64 %t364)
  %t366 = load i64, ptr %local.gj_sq.334
  %t367 = call i64 @"sx_f64_div"(i64 %t365, i64 %t366)
  store i64 %t367, ptr %local.coeff.335
  %t368 = load i64, ptr %local.gj0
  store i64 %t368, ptr %local.gj_d.336
  %t369 = load i64, ptr %local.dim
  %t370 = icmp eq i64 %t369, 1
  %t371 = zext i1 %t370 to i64
  %t372 = icmp ne i64 %t371, 0
  br i1 %t372, label %then14, label %else14
then14:
  %t373 = load i64, ptr %local.gj1
  store i64 %t373, ptr %local.gj_d.336
  br label %then14_end
then14_end:
  br label %endif14
else14:
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t374 = phi i64 [ 0, %then14_end ], [ 0, %else14_end ]
  %t375 = load i64, ptr %local.dim
  %t376 = icmp eq i64 %t375, 2
  %t377 = zext i1 %t376 to i64
  %t378 = icmp ne i64 %t377, 0
  br i1 %t378, label %then15, label %else15
then15:
  %t379 = load i64, ptr %local.gj2
  store i64 %t379, ptr %local.gj_d.336
  br label %then15_end
then15_end:
  br label %endif15
else15:
  br label %else15_end
else15_end:
  br label %endif15
endif15:
  %t380 = phi i64 [ 0, %then15_end ], [ 0, %else15_end ]
  %t381 = load i64, ptr %local.dim
  %t382 = icmp eq i64 %t381, 3
  %t383 = zext i1 %t382 to i64
  %t384 = icmp ne i64 %t383, 0
  br i1 %t384, label %then16, label %else16
then16:
  %t385 = load i64, ptr %local.gj3
  store i64 %t385, ptr %local.gj_d.336
  br label %then16_end
then16_end:
  br label %endif16
else16:
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t386 = phi i64 [ 0, %then16_end ], [ 0, %else16_end ]
  %t387 = load i64, ptr %local.gi_d
  %t388 = load i64, ptr %local.coeff.335
  %t389 = load i64, ptr %local.gj_d.336
  %t390 = call i64 @"sx_f64_mul"(i64 %t388, i64 %t389)
  %t391 = call i64 @"sx_f64_sub"(i64 %t387, i64 %t390)
  ret i64 %t391
}

define i64 @"run_inner"(i64 %a01, i64 %a02, i64 %a03, i64 %a10, i64 %a12, i64 %a13, i64 %a20, i64 %a21, i64 %a23, i64 %a30, i64 %a31, i64 %a32, i64 %inner_steps) nounwind {
entry:
  %local.w0.392 = alloca i64
  %local.w1.393 = alloca i64
  %local.w2.394 = alloca i64
  %local.w3.395 = alloca i64
  %local.step.396 = alloca i64
  %local.lr.397 = alloca i64
  %local.confidence.398 = alloca i64
  %local.mem_strength.399 = alloca i64
  %local.gl0.400 = alloca i64
  %local.gl1.401 = alloca i64
  %local.gl2.402 = alloca i64
  %local.gl3.403 = alloca i64
  %local.go0.404 = alloca i64
  %local.go1.405 = alloca i64
  %local.go2.406 = alloca i64
  %local.go3.407 = alloca i64
  %local.gb0.408 = alloca i64
  %local.gb1.409 = alloca i64
  %local.gb2.410 = alloca i64
  %local.gb3.411 = alloca i64
  %local.gm0.412 = alloca i64
  %local.gm1.413 = alloca i64
  %local.gm2.414 = alloca i64
  %local.gm3.415 = alloca i64
  %local.rl0.416 = alloca i64
  %local.rl1.417 = alloca i64
  %local.rl2.418 = alloca i64
  %local.rl3.419 = alloca i64
  %local.ro0.420 = alloca i64
  %local.ro1.421 = alloca i64
  %local.ro2.422 = alloca i64
  %local.ro3.423 = alloca i64
  %local.lora_lr.424 = alloca i64
  %local.rb0.425 = alloca i64
  %local.rb1.426 = alloca i64
  %local.rb2.427 = alloca i64
  %local.rb3.428 = alloca i64
  %local.belief_lr.429 = alloca i64
  %local.bl.430 = alloca i64
  %local.rm0.431 = alloca i64
  %local.rm1.432 = alloca i64
  %local.rm2.433 = alloca i64
  %local.rm3.434 = alloca i64
  %local.mem_lr.435 = alloca i64
  %local.cl.436 = alloca i64
  %local.a01 = alloca i64
  store i64 %a01, ptr %local.a01
  %local.a02 = alloca i64
  store i64 %a02, ptr %local.a02
  %local.a03 = alloca i64
  store i64 %a03, ptr %local.a03
  %local.a10 = alloca i64
  store i64 %a10, ptr %local.a10
  %local.a12 = alloca i64
  store i64 %a12, ptr %local.a12
  %local.a13 = alloca i64
  store i64 %a13, ptr %local.a13
  %local.a20 = alloca i64
  store i64 %a20, ptr %local.a20
  %local.a21 = alloca i64
  store i64 %a21, ptr %local.a21
  %local.a23 = alloca i64
  store i64 %a23, ptr %local.a23
  %local.a30 = alloca i64
  store i64 %a30, ptr %local.a30
  %local.a31 = alloca i64
  store i64 %a31, ptr %local.a31
  %local.a32 = alloca i64
  store i64 %a32, ptr %local.a32
  %local.inner_steps = alloca i64
  store i64 %inner_steps, ptr %local.inner_steps
  %t437 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.54)
  store i64 %t437, ptr %local.w0.392
  %t438 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.55)
  store i64 %t438, ptr %local.w1.393
  %t439 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.56)
  store i64 %t439, ptr %local.w2.394
  %t440 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.57)
  store i64 %t440, ptr %local.w3.395
  store i64 0, ptr %local.step.396
  %t441 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.58)
  store i64 %t441, ptr %local.lr.397
  %t442 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.59)
  store i64 %t442, ptr %local.confidence.398
  %t443 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.60)
  store i64 %t443, ptr %local.mem_strength.399
  br label %loop17
loop17:
  %t444 = load i64, ptr %local.step.396
  %t445 = load i64, ptr %local.inner_steps
  %t446 = icmp slt i64 %t444, %t445
  %t447 = zext i1 %t446 to i64
  %t448 = icmp ne i64 %t447, 0
  br i1 %t448, label %body17, label %endloop17
body17:
  %t449 = load i64, ptr %local.w0.392
  %t450 = call i64 @"grad_liquid"(i64 %t449, i64 0)
  store i64 %t450, ptr %local.gl0.400
  %t451 = load i64, ptr %local.w1.393
  %t452 = call i64 @"grad_liquid"(i64 %t451, i64 1)
  store i64 %t452, ptr %local.gl1.401
  %t453 = load i64, ptr %local.w2.394
  %t454 = call i64 @"grad_liquid"(i64 %t453, i64 2)
  store i64 %t454, ptr %local.gl2.402
  %t455 = load i64, ptr %local.w3.395
  %t456 = call i64 @"grad_liquid"(i64 %t455, i64 3)
  store i64 %t456, ptr %local.gl3.403
  %t457 = load i64, ptr %local.w0.392
  %t458 = call i64 @"grad_lora"(i64 %t457, i64 0)
  store i64 %t458, ptr %local.go0.404
  %t459 = load i64, ptr %local.w1.393
  %t460 = call i64 @"grad_lora"(i64 %t459, i64 1)
  store i64 %t460, ptr %local.go1.405
  %t461 = load i64, ptr %local.w2.394
  %t462 = call i64 @"grad_lora"(i64 %t461, i64 2)
  store i64 %t462, ptr %local.go2.406
  %t463 = load i64, ptr %local.w3.395
  %t464 = call i64 @"grad_lora"(i64 %t463, i64 3)
  store i64 %t464, ptr %local.go3.407
  %t465 = load i64, ptr %local.confidence.398
  %t466 = load i64, ptr %local.w0.392
  %t467 = call i64 @"grad_belief"(i64 %t466)
  %t468 = call i64 @"sx_f64_mul"(i64 %t465, i64 %t467)
  store i64 %t468, ptr %local.gb0.408
  %t469 = load i64, ptr %local.confidence.398
  %t470 = load i64, ptr %local.w1.393
  %t471 = call i64 @"grad_belief"(i64 %t470)
  %t472 = call i64 @"sx_f64_mul"(i64 %t469, i64 %t471)
  store i64 %t472, ptr %local.gb1.409
  %t473 = load i64, ptr %local.confidence.398
  %t474 = load i64, ptr %local.w2.394
  %t475 = call i64 @"grad_belief"(i64 %t474)
  %t476 = call i64 @"sx_f64_mul"(i64 %t473, i64 %t475)
  store i64 %t476, ptr %local.gb2.410
  %t477 = load i64, ptr %local.confidence.398
  %t478 = load i64, ptr %local.w3.395
  %t479 = call i64 @"grad_belief"(i64 %t478)
  %t480 = call i64 @"sx_f64_mul"(i64 %t477, i64 %t479)
  store i64 %t480, ptr %local.gb3.411
  %t481 = load i64, ptr %local.mem_strength.399
  %t482 = load i64, ptr %local.w0.392
  %t483 = call i64 @"grad_memory"(i64 %t482, i64 0)
  %t484 = call i64 @"sx_f64_mul"(i64 %t481, i64 %t483)
  store i64 %t484, ptr %local.gm0.412
  %t485 = load i64, ptr %local.mem_strength.399
  %t486 = load i64, ptr %local.w1.393
  %t487 = call i64 @"grad_memory"(i64 %t486, i64 1)
  %t488 = call i64 @"sx_f64_mul"(i64 %t485, i64 %t487)
  store i64 %t488, ptr %local.gm1.413
  %t489 = load i64, ptr %local.mem_strength.399
  %t490 = load i64, ptr %local.w2.394
  %t491 = call i64 @"grad_memory"(i64 %t490, i64 2)
  %t492 = call i64 @"sx_f64_mul"(i64 %t489, i64 %t491)
  store i64 %t492, ptr %local.gm2.414
  %t493 = load i64, ptr %local.mem_strength.399
  %t494 = load i64, ptr %local.w3.395
  %t495 = call i64 @"grad_memory"(i64 %t494, i64 3)
  %t496 = call i64 @"sx_f64_mul"(i64 %t493, i64 %t495)
  store i64 %t496, ptr %local.gm3.415
  %t497 = load i64, ptr %local.gl0.400
  %t498 = load i64, ptr %local.gl0.400
  %t499 = load i64, ptr %local.gl1.401
  %t500 = load i64, ptr %local.gl2.402
  %t501 = load i64, ptr %local.gl3.403
  %t502 = load i64, ptr %local.go0.404
  %t503 = load i64, ptr %local.go1.405
  %t504 = load i64, ptr %local.go2.406
  %t505 = load i64, ptr %local.go3.407
  %t506 = load i64, ptr %local.a01
  %t507 = call i64 @"project_1d"(i64 %t497, i64 %t498, i64 %t499, i64 %t500, i64 %t501, i64 %t502, i64 %t503, i64 %t504, i64 %t505, i64 %t506, i64 0)
  store i64 %t507, ptr %local.rl0.416
  %t508 = load i64, ptr %local.rl0.416
  %t509 = load i64, ptr %local.gl0.400
  %t510 = load i64, ptr %local.gl1.401
  %t511 = load i64, ptr %local.gl2.402
  %t512 = load i64, ptr %local.gl3.403
  %t513 = load i64, ptr %local.gb0.408
  %t514 = load i64, ptr %local.gb1.409
  %t515 = load i64, ptr %local.gb2.410
  %t516 = load i64, ptr %local.gb3.411
  %t517 = load i64, ptr %local.a02
  %t518 = call i64 @"project_1d"(i64 %t508, i64 %t509, i64 %t510, i64 %t511, i64 %t512, i64 %t513, i64 %t514, i64 %t515, i64 %t516, i64 %t517, i64 0)
  store i64 %t518, ptr %local.rl0.416
  %t519 = load i64, ptr %local.rl0.416
  %t520 = load i64, ptr %local.gl0.400
  %t521 = load i64, ptr %local.gl1.401
  %t522 = load i64, ptr %local.gl2.402
  %t523 = load i64, ptr %local.gl3.403
  %t524 = load i64, ptr %local.gm0.412
  %t525 = load i64, ptr %local.gm1.413
  %t526 = load i64, ptr %local.gm2.414
  %t527 = load i64, ptr %local.gm3.415
  %t528 = load i64, ptr %local.a03
  %t529 = call i64 @"project_1d"(i64 %t519, i64 %t520, i64 %t521, i64 %t522, i64 %t523, i64 %t524, i64 %t525, i64 %t526, i64 %t527, i64 %t528, i64 0)
  store i64 %t529, ptr %local.rl0.416
  %t530 = load i64, ptr %local.gl1.401
  %t531 = load i64, ptr %local.gl0.400
  %t532 = load i64, ptr %local.gl1.401
  %t533 = load i64, ptr %local.gl2.402
  %t534 = load i64, ptr %local.gl3.403
  %t535 = load i64, ptr %local.go0.404
  %t536 = load i64, ptr %local.go1.405
  %t537 = load i64, ptr %local.go2.406
  %t538 = load i64, ptr %local.go3.407
  %t539 = load i64, ptr %local.a01
  %t540 = call i64 @"project_1d"(i64 %t530, i64 %t531, i64 %t532, i64 %t533, i64 %t534, i64 %t535, i64 %t536, i64 %t537, i64 %t538, i64 %t539, i64 1)
  store i64 %t540, ptr %local.rl1.417
  %t541 = load i64, ptr %local.rl1.417
  %t542 = load i64, ptr %local.gl0.400
  %t543 = load i64, ptr %local.gl1.401
  %t544 = load i64, ptr %local.gl2.402
  %t545 = load i64, ptr %local.gl3.403
  %t546 = load i64, ptr %local.gb0.408
  %t547 = load i64, ptr %local.gb1.409
  %t548 = load i64, ptr %local.gb2.410
  %t549 = load i64, ptr %local.gb3.411
  %t550 = load i64, ptr %local.a02
  %t551 = call i64 @"project_1d"(i64 %t541, i64 %t542, i64 %t543, i64 %t544, i64 %t545, i64 %t546, i64 %t547, i64 %t548, i64 %t549, i64 %t550, i64 1)
  store i64 %t551, ptr %local.rl1.417
  %t552 = load i64, ptr %local.rl1.417
  %t553 = load i64, ptr %local.gl0.400
  %t554 = load i64, ptr %local.gl1.401
  %t555 = load i64, ptr %local.gl2.402
  %t556 = load i64, ptr %local.gl3.403
  %t557 = load i64, ptr %local.gm0.412
  %t558 = load i64, ptr %local.gm1.413
  %t559 = load i64, ptr %local.gm2.414
  %t560 = load i64, ptr %local.gm3.415
  %t561 = load i64, ptr %local.a03
  %t562 = call i64 @"project_1d"(i64 %t552, i64 %t553, i64 %t554, i64 %t555, i64 %t556, i64 %t557, i64 %t558, i64 %t559, i64 %t560, i64 %t561, i64 1)
  store i64 %t562, ptr %local.rl1.417
  %t563 = load i64, ptr %local.gl2.402
  %t564 = load i64, ptr %local.gl0.400
  %t565 = load i64, ptr %local.gl1.401
  %t566 = load i64, ptr %local.gl2.402
  %t567 = load i64, ptr %local.gl3.403
  %t568 = load i64, ptr %local.go0.404
  %t569 = load i64, ptr %local.go1.405
  %t570 = load i64, ptr %local.go2.406
  %t571 = load i64, ptr %local.go3.407
  %t572 = load i64, ptr %local.a01
  %t573 = call i64 @"project_1d"(i64 %t563, i64 %t564, i64 %t565, i64 %t566, i64 %t567, i64 %t568, i64 %t569, i64 %t570, i64 %t571, i64 %t572, i64 2)
  store i64 %t573, ptr %local.rl2.418
  %t574 = load i64, ptr %local.rl2.418
  %t575 = load i64, ptr %local.gl0.400
  %t576 = load i64, ptr %local.gl1.401
  %t577 = load i64, ptr %local.gl2.402
  %t578 = load i64, ptr %local.gl3.403
  %t579 = load i64, ptr %local.gb0.408
  %t580 = load i64, ptr %local.gb1.409
  %t581 = load i64, ptr %local.gb2.410
  %t582 = load i64, ptr %local.gb3.411
  %t583 = load i64, ptr %local.a02
  %t584 = call i64 @"project_1d"(i64 %t574, i64 %t575, i64 %t576, i64 %t577, i64 %t578, i64 %t579, i64 %t580, i64 %t581, i64 %t582, i64 %t583, i64 2)
  store i64 %t584, ptr %local.rl2.418
  %t585 = load i64, ptr %local.rl2.418
  %t586 = load i64, ptr %local.gl0.400
  %t587 = load i64, ptr %local.gl1.401
  %t588 = load i64, ptr %local.gl2.402
  %t589 = load i64, ptr %local.gl3.403
  %t590 = load i64, ptr %local.gm0.412
  %t591 = load i64, ptr %local.gm1.413
  %t592 = load i64, ptr %local.gm2.414
  %t593 = load i64, ptr %local.gm3.415
  %t594 = load i64, ptr %local.a03
  %t595 = call i64 @"project_1d"(i64 %t585, i64 %t586, i64 %t587, i64 %t588, i64 %t589, i64 %t590, i64 %t591, i64 %t592, i64 %t593, i64 %t594, i64 2)
  store i64 %t595, ptr %local.rl2.418
  %t596 = load i64, ptr %local.gl3.403
  %t597 = load i64, ptr %local.gl0.400
  %t598 = load i64, ptr %local.gl1.401
  %t599 = load i64, ptr %local.gl2.402
  %t600 = load i64, ptr %local.gl3.403
  %t601 = load i64, ptr %local.go0.404
  %t602 = load i64, ptr %local.go1.405
  %t603 = load i64, ptr %local.go2.406
  %t604 = load i64, ptr %local.go3.407
  %t605 = load i64, ptr %local.a01
  %t606 = call i64 @"project_1d"(i64 %t596, i64 %t597, i64 %t598, i64 %t599, i64 %t600, i64 %t601, i64 %t602, i64 %t603, i64 %t604, i64 %t605, i64 3)
  store i64 %t606, ptr %local.rl3.419
  %t607 = load i64, ptr %local.rl3.419
  %t608 = load i64, ptr %local.gl0.400
  %t609 = load i64, ptr %local.gl1.401
  %t610 = load i64, ptr %local.gl2.402
  %t611 = load i64, ptr %local.gl3.403
  %t612 = load i64, ptr %local.gb0.408
  %t613 = load i64, ptr %local.gb1.409
  %t614 = load i64, ptr %local.gb2.410
  %t615 = load i64, ptr %local.gb3.411
  %t616 = load i64, ptr %local.a02
  %t617 = call i64 @"project_1d"(i64 %t607, i64 %t608, i64 %t609, i64 %t610, i64 %t611, i64 %t612, i64 %t613, i64 %t614, i64 %t615, i64 %t616, i64 3)
  store i64 %t617, ptr %local.rl3.419
  %t618 = load i64, ptr %local.rl3.419
  %t619 = load i64, ptr %local.gl0.400
  %t620 = load i64, ptr %local.gl1.401
  %t621 = load i64, ptr %local.gl2.402
  %t622 = load i64, ptr %local.gl3.403
  %t623 = load i64, ptr %local.gm0.412
  %t624 = load i64, ptr %local.gm1.413
  %t625 = load i64, ptr %local.gm2.414
  %t626 = load i64, ptr %local.gm3.415
  %t627 = load i64, ptr %local.a03
  %t628 = call i64 @"project_1d"(i64 %t618, i64 %t619, i64 %t620, i64 %t621, i64 %t622, i64 %t623, i64 %t624, i64 %t625, i64 %t626, i64 %t627, i64 3)
  store i64 %t628, ptr %local.rl3.419
  %t629 = load i64, ptr %local.w0.392
  %t630 = load i64, ptr %local.lr.397
  %t631 = load i64, ptr %local.rl0.416
  %t632 = call i64 @"sx_f64_mul"(i64 %t630, i64 %t631)
  %t633 = call i64 @"sx_f64_sub"(i64 %t629, i64 %t632)
  store i64 %t633, ptr %local.w0.392
  %t634 = load i64, ptr %local.w1.393
  %t635 = load i64, ptr %local.lr.397
  %t636 = load i64, ptr %local.rl1.417
  %t637 = call i64 @"sx_f64_mul"(i64 %t635, i64 %t636)
  %t638 = call i64 @"sx_f64_sub"(i64 %t634, i64 %t637)
  store i64 %t638, ptr %local.w1.393
  %t639 = load i64, ptr %local.w2.394
  %t640 = load i64, ptr %local.lr.397
  %t641 = load i64, ptr %local.rl2.418
  %t642 = call i64 @"sx_f64_mul"(i64 %t640, i64 %t641)
  %t643 = call i64 @"sx_f64_sub"(i64 %t639, i64 %t642)
  store i64 %t643, ptr %local.w2.394
  %t644 = load i64, ptr %local.w3.395
  %t645 = load i64, ptr %local.lr.397
  %t646 = load i64, ptr %local.rl3.419
  %t647 = call i64 @"sx_f64_mul"(i64 %t645, i64 %t646)
  %t648 = call i64 @"sx_f64_sub"(i64 %t644, i64 %t647)
  store i64 %t648, ptr %local.w3.395
  %t649 = load i64, ptr %local.step.396
  %t650 = icmp sgt i64 %t649, 0
  %t651 = zext i1 %t650 to i64
  %t652 = icmp ne i64 %t651, 0
  br i1 %t652, label %then18, label %else18
then18:
  %t653 = load i64, ptr %local.step.396
  %t654 = call i64 @"is_step_multiple"(i64 %t653, i64 10)
  %t655 = icmp eq i64 %t654, 1
  %t656 = zext i1 %t655 to i64
  %t657 = icmp ne i64 %t656, 0
  br i1 %t657, label %then19, label %else19
then19:
  %t658 = load i64, ptr %local.go0.404
  %t659 = load i64, ptr %local.go0.404
  %t660 = load i64, ptr %local.go1.405
  %t661 = load i64, ptr %local.go2.406
  %t662 = load i64, ptr %local.go3.407
  %t663 = load i64, ptr %local.gl0.400
  %t664 = load i64, ptr %local.gl1.401
  %t665 = load i64, ptr %local.gl2.402
  %t666 = load i64, ptr %local.gl3.403
  %t667 = load i64, ptr %local.a10
  %t668 = call i64 @"project_1d"(i64 %t658, i64 %t659, i64 %t660, i64 %t661, i64 %t662, i64 %t663, i64 %t664, i64 %t665, i64 %t666, i64 %t667, i64 0)
  store i64 %t668, ptr %local.ro0.420
  %t669 = load i64, ptr %local.ro0.420
  %t670 = load i64, ptr %local.go0.404
  %t671 = load i64, ptr %local.go1.405
  %t672 = load i64, ptr %local.go2.406
  %t673 = load i64, ptr %local.go3.407
  %t674 = load i64, ptr %local.gb0.408
  %t675 = load i64, ptr %local.gb1.409
  %t676 = load i64, ptr %local.gb2.410
  %t677 = load i64, ptr %local.gb3.411
  %t678 = load i64, ptr %local.a12
  %t679 = call i64 @"project_1d"(i64 %t669, i64 %t670, i64 %t671, i64 %t672, i64 %t673, i64 %t674, i64 %t675, i64 %t676, i64 %t677, i64 %t678, i64 0)
  store i64 %t679, ptr %local.ro0.420
  %t680 = load i64, ptr %local.ro0.420
  %t681 = load i64, ptr %local.go0.404
  %t682 = load i64, ptr %local.go1.405
  %t683 = load i64, ptr %local.go2.406
  %t684 = load i64, ptr %local.go3.407
  %t685 = load i64, ptr %local.gm0.412
  %t686 = load i64, ptr %local.gm1.413
  %t687 = load i64, ptr %local.gm2.414
  %t688 = load i64, ptr %local.gm3.415
  %t689 = load i64, ptr %local.a13
  %t690 = call i64 @"project_1d"(i64 %t680, i64 %t681, i64 %t682, i64 %t683, i64 %t684, i64 %t685, i64 %t686, i64 %t687, i64 %t688, i64 %t689, i64 0)
  store i64 %t690, ptr %local.ro0.420
  %t691 = load i64, ptr %local.go1.405
  %t692 = load i64, ptr %local.go0.404
  %t693 = load i64, ptr %local.go1.405
  %t694 = load i64, ptr %local.go2.406
  %t695 = load i64, ptr %local.go3.407
  %t696 = load i64, ptr %local.gl0.400
  %t697 = load i64, ptr %local.gl1.401
  %t698 = load i64, ptr %local.gl2.402
  %t699 = load i64, ptr %local.gl3.403
  %t700 = load i64, ptr %local.a10
  %t701 = call i64 @"project_1d"(i64 %t691, i64 %t692, i64 %t693, i64 %t694, i64 %t695, i64 %t696, i64 %t697, i64 %t698, i64 %t699, i64 %t700, i64 1)
  store i64 %t701, ptr %local.ro1.421
  %t702 = load i64, ptr %local.ro1.421
  %t703 = load i64, ptr %local.go0.404
  %t704 = load i64, ptr %local.go1.405
  %t705 = load i64, ptr %local.go2.406
  %t706 = load i64, ptr %local.go3.407
  %t707 = load i64, ptr %local.gb0.408
  %t708 = load i64, ptr %local.gb1.409
  %t709 = load i64, ptr %local.gb2.410
  %t710 = load i64, ptr %local.gb3.411
  %t711 = load i64, ptr %local.a12
  %t712 = call i64 @"project_1d"(i64 %t702, i64 %t703, i64 %t704, i64 %t705, i64 %t706, i64 %t707, i64 %t708, i64 %t709, i64 %t710, i64 %t711, i64 1)
  store i64 %t712, ptr %local.ro1.421
  %t713 = load i64, ptr %local.ro1.421
  %t714 = load i64, ptr %local.go0.404
  %t715 = load i64, ptr %local.go1.405
  %t716 = load i64, ptr %local.go2.406
  %t717 = load i64, ptr %local.go3.407
  %t718 = load i64, ptr %local.gm0.412
  %t719 = load i64, ptr %local.gm1.413
  %t720 = load i64, ptr %local.gm2.414
  %t721 = load i64, ptr %local.gm3.415
  %t722 = load i64, ptr %local.a13
  %t723 = call i64 @"project_1d"(i64 %t713, i64 %t714, i64 %t715, i64 %t716, i64 %t717, i64 %t718, i64 %t719, i64 %t720, i64 %t721, i64 %t722, i64 1)
  store i64 %t723, ptr %local.ro1.421
  %t724 = load i64, ptr %local.go2.406
  %t725 = load i64, ptr %local.go0.404
  %t726 = load i64, ptr %local.go1.405
  %t727 = load i64, ptr %local.go2.406
  %t728 = load i64, ptr %local.go3.407
  %t729 = load i64, ptr %local.gl0.400
  %t730 = load i64, ptr %local.gl1.401
  %t731 = load i64, ptr %local.gl2.402
  %t732 = load i64, ptr %local.gl3.403
  %t733 = load i64, ptr %local.a10
  %t734 = call i64 @"project_1d"(i64 %t724, i64 %t725, i64 %t726, i64 %t727, i64 %t728, i64 %t729, i64 %t730, i64 %t731, i64 %t732, i64 %t733, i64 2)
  store i64 %t734, ptr %local.ro2.422
  %t735 = load i64, ptr %local.ro2.422
  %t736 = load i64, ptr %local.go0.404
  %t737 = load i64, ptr %local.go1.405
  %t738 = load i64, ptr %local.go2.406
  %t739 = load i64, ptr %local.go3.407
  %t740 = load i64, ptr %local.gb0.408
  %t741 = load i64, ptr %local.gb1.409
  %t742 = load i64, ptr %local.gb2.410
  %t743 = load i64, ptr %local.gb3.411
  %t744 = load i64, ptr %local.a12
  %t745 = call i64 @"project_1d"(i64 %t735, i64 %t736, i64 %t737, i64 %t738, i64 %t739, i64 %t740, i64 %t741, i64 %t742, i64 %t743, i64 %t744, i64 2)
  store i64 %t745, ptr %local.ro2.422
  %t746 = load i64, ptr %local.ro2.422
  %t747 = load i64, ptr %local.go0.404
  %t748 = load i64, ptr %local.go1.405
  %t749 = load i64, ptr %local.go2.406
  %t750 = load i64, ptr %local.go3.407
  %t751 = load i64, ptr %local.gm0.412
  %t752 = load i64, ptr %local.gm1.413
  %t753 = load i64, ptr %local.gm2.414
  %t754 = load i64, ptr %local.gm3.415
  %t755 = load i64, ptr %local.a13
  %t756 = call i64 @"project_1d"(i64 %t746, i64 %t747, i64 %t748, i64 %t749, i64 %t750, i64 %t751, i64 %t752, i64 %t753, i64 %t754, i64 %t755, i64 2)
  store i64 %t756, ptr %local.ro2.422
  %t757 = load i64, ptr %local.go3.407
  %t758 = load i64, ptr %local.go0.404
  %t759 = load i64, ptr %local.go1.405
  %t760 = load i64, ptr %local.go2.406
  %t761 = load i64, ptr %local.go3.407
  %t762 = load i64, ptr %local.gl0.400
  %t763 = load i64, ptr %local.gl1.401
  %t764 = load i64, ptr %local.gl2.402
  %t765 = load i64, ptr %local.gl3.403
  %t766 = load i64, ptr %local.a10
  %t767 = call i64 @"project_1d"(i64 %t757, i64 %t758, i64 %t759, i64 %t760, i64 %t761, i64 %t762, i64 %t763, i64 %t764, i64 %t765, i64 %t766, i64 3)
  store i64 %t767, ptr %local.ro3.423
  %t768 = load i64, ptr %local.ro3.423
  %t769 = load i64, ptr %local.go0.404
  %t770 = load i64, ptr %local.go1.405
  %t771 = load i64, ptr %local.go2.406
  %t772 = load i64, ptr %local.go3.407
  %t773 = load i64, ptr %local.gb0.408
  %t774 = load i64, ptr %local.gb1.409
  %t775 = load i64, ptr %local.gb2.410
  %t776 = load i64, ptr %local.gb3.411
  %t777 = load i64, ptr %local.a12
  %t778 = call i64 @"project_1d"(i64 %t768, i64 %t769, i64 %t770, i64 %t771, i64 %t772, i64 %t773, i64 %t774, i64 %t775, i64 %t776, i64 %t777, i64 3)
  store i64 %t778, ptr %local.ro3.423
  %t779 = load i64, ptr %local.ro3.423
  %t780 = load i64, ptr %local.go0.404
  %t781 = load i64, ptr %local.go1.405
  %t782 = load i64, ptr %local.go2.406
  %t783 = load i64, ptr %local.go3.407
  %t784 = load i64, ptr %local.gm0.412
  %t785 = load i64, ptr %local.gm1.413
  %t786 = load i64, ptr %local.gm2.414
  %t787 = load i64, ptr %local.gm3.415
  %t788 = load i64, ptr %local.a13
  %t789 = call i64 @"project_1d"(i64 %t779, i64 %t780, i64 %t781, i64 %t782, i64 %t783, i64 %t784, i64 %t785, i64 %t786, i64 %t787, i64 %t788, i64 3)
  store i64 %t789, ptr %local.ro3.423
  %t790 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.61)
  store i64 %t790, ptr %local.lora_lr.424
  %t791 = load i64, ptr %local.w0.392
  %t792 = load i64, ptr %local.lora_lr.424
  %t793 = load i64, ptr %local.ro0.420
  %t794 = call i64 @"sx_f64_mul"(i64 %t792, i64 %t793)
  %t795 = call i64 @"sx_f64_sub"(i64 %t791, i64 %t794)
  store i64 %t795, ptr %local.w0.392
  %t796 = load i64, ptr %local.w1.393
  %t797 = load i64, ptr %local.lora_lr.424
  %t798 = load i64, ptr %local.ro1.421
  %t799 = call i64 @"sx_f64_mul"(i64 %t797, i64 %t798)
  %t800 = call i64 @"sx_f64_sub"(i64 %t796, i64 %t799)
  store i64 %t800, ptr %local.w1.393
  %t801 = load i64, ptr %local.w2.394
  %t802 = load i64, ptr %local.lora_lr.424
  %t803 = load i64, ptr %local.ro2.422
  %t804 = call i64 @"sx_f64_mul"(i64 %t802, i64 %t803)
  %t805 = call i64 @"sx_f64_sub"(i64 %t801, i64 %t804)
  store i64 %t805, ptr %local.w2.394
  %t806 = load i64, ptr %local.w3.395
  %t807 = load i64, ptr %local.lora_lr.424
  %t808 = load i64, ptr %local.ro3.423
  %t809 = call i64 @"sx_f64_mul"(i64 %t807, i64 %t808)
  %t810 = call i64 @"sx_f64_sub"(i64 %t806, i64 %t809)
  store i64 %t810, ptr %local.w3.395
  br label %then19_end
then19_end:
  br label %endif19
else19:
  br label %else19_end
else19_end:
  br label %endif19
endif19:
  %t811 = phi i64 [ 0, %then19_end ], [ 0, %else19_end ]
  br label %then18_end
then18_end:
  br label %endif18
else18:
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t812 = phi i64 [ %t811, %then18_end ], [ 0, %else18_end ]
  %t813 = load i64, ptr %local.step.396
  %t814 = icmp sgt i64 %t813, 0
  %t815 = zext i1 %t814 to i64
  %t816 = icmp ne i64 %t815, 0
  br i1 %t816, label %then20, label %else20
then20:
  %t817 = load i64, ptr %local.step.396
  %t818 = call i64 @"is_step_multiple"(i64 %t817, i64 20)
  %t819 = icmp eq i64 %t818, 1
  %t820 = zext i1 %t819 to i64
  %t821 = icmp ne i64 %t820, 0
  br i1 %t821, label %then21, label %else21
then21:
  %t822 = load i64, ptr %local.gb0.408
  %t823 = load i64, ptr %local.gb0.408
  %t824 = load i64, ptr %local.gb1.409
  %t825 = load i64, ptr %local.gb2.410
  %t826 = load i64, ptr %local.gb3.411
  %t827 = load i64, ptr %local.gl0.400
  %t828 = load i64, ptr %local.gl1.401
  %t829 = load i64, ptr %local.gl2.402
  %t830 = load i64, ptr %local.gl3.403
  %t831 = load i64, ptr %local.a20
  %t832 = call i64 @"project_1d"(i64 %t822, i64 %t823, i64 %t824, i64 %t825, i64 %t826, i64 %t827, i64 %t828, i64 %t829, i64 %t830, i64 %t831, i64 0)
  store i64 %t832, ptr %local.rb0.425
  %t833 = load i64, ptr %local.rb0.425
  %t834 = load i64, ptr %local.gb0.408
  %t835 = load i64, ptr %local.gb1.409
  %t836 = load i64, ptr %local.gb2.410
  %t837 = load i64, ptr %local.gb3.411
  %t838 = load i64, ptr %local.go0.404
  %t839 = load i64, ptr %local.go1.405
  %t840 = load i64, ptr %local.go2.406
  %t841 = load i64, ptr %local.go3.407
  %t842 = load i64, ptr %local.a21
  %t843 = call i64 @"project_1d"(i64 %t833, i64 %t834, i64 %t835, i64 %t836, i64 %t837, i64 %t838, i64 %t839, i64 %t840, i64 %t841, i64 %t842, i64 0)
  store i64 %t843, ptr %local.rb0.425
  %t844 = load i64, ptr %local.rb0.425
  %t845 = load i64, ptr %local.gb0.408
  %t846 = load i64, ptr %local.gb1.409
  %t847 = load i64, ptr %local.gb2.410
  %t848 = load i64, ptr %local.gb3.411
  %t849 = load i64, ptr %local.gm0.412
  %t850 = load i64, ptr %local.gm1.413
  %t851 = load i64, ptr %local.gm2.414
  %t852 = load i64, ptr %local.gm3.415
  %t853 = load i64, ptr %local.a23
  %t854 = call i64 @"project_1d"(i64 %t844, i64 %t845, i64 %t846, i64 %t847, i64 %t848, i64 %t849, i64 %t850, i64 %t851, i64 %t852, i64 %t853, i64 0)
  store i64 %t854, ptr %local.rb0.425
  %t855 = load i64, ptr %local.gb1.409
  %t856 = load i64, ptr %local.gb0.408
  %t857 = load i64, ptr %local.gb1.409
  %t858 = load i64, ptr %local.gb2.410
  %t859 = load i64, ptr %local.gb3.411
  %t860 = load i64, ptr %local.gl0.400
  %t861 = load i64, ptr %local.gl1.401
  %t862 = load i64, ptr %local.gl2.402
  %t863 = load i64, ptr %local.gl3.403
  %t864 = load i64, ptr %local.a20
  %t865 = call i64 @"project_1d"(i64 %t855, i64 %t856, i64 %t857, i64 %t858, i64 %t859, i64 %t860, i64 %t861, i64 %t862, i64 %t863, i64 %t864, i64 1)
  store i64 %t865, ptr %local.rb1.426
  %t866 = load i64, ptr %local.rb1.426
  %t867 = load i64, ptr %local.gb0.408
  %t868 = load i64, ptr %local.gb1.409
  %t869 = load i64, ptr %local.gb2.410
  %t870 = load i64, ptr %local.gb3.411
  %t871 = load i64, ptr %local.go0.404
  %t872 = load i64, ptr %local.go1.405
  %t873 = load i64, ptr %local.go2.406
  %t874 = load i64, ptr %local.go3.407
  %t875 = load i64, ptr %local.a21
  %t876 = call i64 @"project_1d"(i64 %t866, i64 %t867, i64 %t868, i64 %t869, i64 %t870, i64 %t871, i64 %t872, i64 %t873, i64 %t874, i64 %t875, i64 1)
  store i64 %t876, ptr %local.rb1.426
  %t877 = load i64, ptr %local.rb1.426
  %t878 = load i64, ptr %local.gb0.408
  %t879 = load i64, ptr %local.gb1.409
  %t880 = load i64, ptr %local.gb2.410
  %t881 = load i64, ptr %local.gb3.411
  %t882 = load i64, ptr %local.gm0.412
  %t883 = load i64, ptr %local.gm1.413
  %t884 = load i64, ptr %local.gm2.414
  %t885 = load i64, ptr %local.gm3.415
  %t886 = load i64, ptr %local.a23
  %t887 = call i64 @"project_1d"(i64 %t877, i64 %t878, i64 %t879, i64 %t880, i64 %t881, i64 %t882, i64 %t883, i64 %t884, i64 %t885, i64 %t886, i64 1)
  store i64 %t887, ptr %local.rb1.426
  %t888 = load i64, ptr %local.gb2.410
  %t889 = load i64, ptr %local.gb0.408
  %t890 = load i64, ptr %local.gb1.409
  %t891 = load i64, ptr %local.gb2.410
  %t892 = load i64, ptr %local.gb3.411
  %t893 = load i64, ptr %local.gl0.400
  %t894 = load i64, ptr %local.gl1.401
  %t895 = load i64, ptr %local.gl2.402
  %t896 = load i64, ptr %local.gl3.403
  %t897 = load i64, ptr %local.a20
  %t898 = call i64 @"project_1d"(i64 %t888, i64 %t889, i64 %t890, i64 %t891, i64 %t892, i64 %t893, i64 %t894, i64 %t895, i64 %t896, i64 %t897, i64 2)
  store i64 %t898, ptr %local.rb2.427
  %t899 = load i64, ptr %local.rb2.427
  %t900 = load i64, ptr %local.gb0.408
  %t901 = load i64, ptr %local.gb1.409
  %t902 = load i64, ptr %local.gb2.410
  %t903 = load i64, ptr %local.gb3.411
  %t904 = load i64, ptr %local.go0.404
  %t905 = load i64, ptr %local.go1.405
  %t906 = load i64, ptr %local.go2.406
  %t907 = load i64, ptr %local.go3.407
  %t908 = load i64, ptr %local.a21
  %t909 = call i64 @"project_1d"(i64 %t899, i64 %t900, i64 %t901, i64 %t902, i64 %t903, i64 %t904, i64 %t905, i64 %t906, i64 %t907, i64 %t908, i64 2)
  store i64 %t909, ptr %local.rb2.427
  %t910 = load i64, ptr %local.rb2.427
  %t911 = load i64, ptr %local.gb0.408
  %t912 = load i64, ptr %local.gb1.409
  %t913 = load i64, ptr %local.gb2.410
  %t914 = load i64, ptr %local.gb3.411
  %t915 = load i64, ptr %local.gm0.412
  %t916 = load i64, ptr %local.gm1.413
  %t917 = load i64, ptr %local.gm2.414
  %t918 = load i64, ptr %local.gm3.415
  %t919 = load i64, ptr %local.a23
  %t920 = call i64 @"project_1d"(i64 %t910, i64 %t911, i64 %t912, i64 %t913, i64 %t914, i64 %t915, i64 %t916, i64 %t917, i64 %t918, i64 %t919, i64 2)
  store i64 %t920, ptr %local.rb2.427
  %t921 = load i64, ptr %local.gb3.411
  %t922 = load i64, ptr %local.gb0.408
  %t923 = load i64, ptr %local.gb1.409
  %t924 = load i64, ptr %local.gb2.410
  %t925 = load i64, ptr %local.gb3.411
  %t926 = load i64, ptr %local.gl0.400
  %t927 = load i64, ptr %local.gl1.401
  %t928 = load i64, ptr %local.gl2.402
  %t929 = load i64, ptr %local.gl3.403
  %t930 = load i64, ptr %local.a20
  %t931 = call i64 @"project_1d"(i64 %t921, i64 %t922, i64 %t923, i64 %t924, i64 %t925, i64 %t926, i64 %t927, i64 %t928, i64 %t929, i64 %t930, i64 3)
  store i64 %t931, ptr %local.rb3.428
  %t932 = load i64, ptr %local.rb3.428
  %t933 = load i64, ptr %local.gb0.408
  %t934 = load i64, ptr %local.gb1.409
  %t935 = load i64, ptr %local.gb2.410
  %t936 = load i64, ptr %local.gb3.411
  %t937 = load i64, ptr %local.go0.404
  %t938 = load i64, ptr %local.go1.405
  %t939 = load i64, ptr %local.go2.406
  %t940 = load i64, ptr %local.go3.407
  %t941 = load i64, ptr %local.a21
  %t942 = call i64 @"project_1d"(i64 %t932, i64 %t933, i64 %t934, i64 %t935, i64 %t936, i64 %t937, i64 %t938, i64 %t939, i64 %t940, i64 %t941, i64 3)
  store i64 %t942, ptr %local.rb3.428
  %t943 = load i64, ptr %local.rb3.428
  %t944 = load i64, ptr %local.gb0.408
  %t945 = load i64, ptr %local.gb1.409
  %t946 = load i64, ptr %local.gb2.410
  %t947 = load i64, ptr %local.gb3.411
  %t948 = load i64, ptr %local.gm0.412
  %t949 = load i64, ptr %local.gm1.413
  %t950 = load i64, ptr %local.gm2.414
  %t951 = load i64, ptr %local.gm3.415
  %t952 = load i64, ptr %local.a23
  %t953 = call i64 @"project_1d"(i64 %t943, i64 %t944, i64 %t945, i64 %t946, i64 %t947, i64 %t948, i64 %t949, i64 %t950, i64 %t951, i64 %t952, i64 3)
  store i64 %t953, ptr %local.rb3.428
  %t954 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.62)
  store i64 %t954, ptr %local.belief_lr.429
  %t955 = load i64, ptr %local.w0.392
  %t956 = load i64, ptr %local.belief_lr.429
  %t957 = load i64, ptr %local.rb0.425
  %t958 = call i64 @"sx_f64_mul"(i64 %t956, i64 %t957)
  %t959 = call i64 @"sx_f64_sub"(i64 %t955, i64 %t958)
  store i64 %t959, ptr %local.w0.392
  %t960 = load i64, ptr %local.w1.393
  %t961 = load i64, ptr %local.belief_lr.429
  %t962 = load i64, ptr %local.rb1.426
  %t963 = call i64 @"sx_f64_mul"(i64 %t961, i64 %t962)
  %t964 = call i64 @"sx_f64_sub"(i64 %t960, i64 %t963)
  store i64 %t964, ptr %local.w1.393
  %t965 = load i64, ptr %local.w2.394
  %t966 = load i64, ptr %local.belief_lr.429
  %t967 = load i64, ptr %local.rb2.427
  %t968 = call i64 @"sx_f64_mul"(i64 %t966, i64 %t967)
  %t969 = call i64 @"sx_f64_sub"(i64 %t965, i64 %t968)
  store i64 %t969, ptr %local.w2.394
  %t970 = load i64, ptr %local.w3.395
  %t971 = load i64, ptr %local.belief_lr.429
  %t972 = load i64, ptr %local.rb3.428
  %t973 = call i64 @"sx_f64_mul"(i64 %t971, i64 %t972)
  %t974 = call i64 @"sx_f64_sub"(i64 %t970, i64 %t973)
  store i64 %t974, ptr %local.w3.395
  %t975 = load i64, ptr %local.w0.392
  %t976 = load i64, ptr %local.w1.393
  %t977 = load i64, ptr %local.w2.394
  %t978 = load i64, ptr %local.w3.395
  %t979 = call i64 @"loss_belief"(i64 %t975, i64 %t976, i64 %t977, i64 %t978)
  store i64 %t979, ptr %local.bl.430
  %t980 = load i64, ptr %local.confidence.398
  %t981 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.63)
  %t982 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.64)
  %t983 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.65)
  %t984 = load i64, ptr %local.bl.430
  %t985 = call i64 @"sx_f64_add"(i64 %t983, i64 %t984)
  %t986 = call i64 @"sx_f64_div"(i64 %t982, i64 %t985)
  %t987 = load i64, ptr %local.confidence.398
  %t988 = call i64 @"sx_f64_sub"(i64 %t986, i64 %t987)
  %t989 = call i64 @"sx_f64_mul"(i64 %t981, i64 %t988)
  %t990 = call i64 @"sx_f64_add"(i64 %t980, i64 %t989)
  store i64 %t990, ptr %local.confidence.398
  %t991 = load i64, ptr %local.confidence.398
  %t992 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.66)
  %t993 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.67)
  %t994 = call i64 @"clamp"(i64 %t991, i64 %t992, i64 %t993)
  store i64 %t994, ptr %local.confidence.398
  br label %then21_end
then21_end:
  br label %endif21
else21:
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t995 = phi i64 [ 0, %then21_end ], [ 0, %else21_end ]
  br label %then20_end
then20_end:
  br label %endif20
else20:
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t996 = phi i64 [ %t995, %then20_end ], [ 0, %else20_end ]
  %t997 = load i64, ptr %local.step.396
  %t998 = icmp sgt i64 %t997, 0
  %t999 = zext i1 %t998 to i64
  %t1000 = icmp ne i64 %t999, 0
  br i1 %t1000, label %then22, label %else22
then22:
  %t1001 = load i64, ptr %local.step.396
  %t1002 = call i64 @"is_step_multiple"(i64 %t1001, i64 50)
  %t1003 = icmp eq i64 %t1002, 1
  %t1004 = zext i1 %t1003 to i64
  %t1005 = icmp ne i64 %t1004, 0
  br i1 %t1005, label %then23, label %else23
then23:
  %t1006 = load i64, ptr %local.mem_strength.399
  %t1007 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.68)
  %t1008 = call i64 @"sx_f64_add"(i64 %t1006, i64 %t1007)
  %t1009 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.69)
  %t1010 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.70)
  %t1011 = call i64 @"clamp"(i64 %t1008, i64 %t1009, i64 %t1010)
  store i64 %t1011, ptr %local.mem_strength.399
  %t1012 = load i64, ptr %local.gm0.412
  %t1013 = load i64, ptr %local.gm0.412
  %t1014 = load i64, ptr %local.gm1.413
  %t1015 = load i64, ptr %local.gm2.414
  %t1016 = load i64, ptr %local.gm3.415
  %t1017 = load i64, ptr %local.gl0.400
  %t1018 = load i64, ptr %local.gl1.401
  %t1019 = load i64, ptr %local.gl2.402
  %t1020 = load i64, ptr %local.gl3.403
  %t1021 = load i64, ptr %local.a30
  %t1022 = call i64 @"project_1d"(i64 %t1012, i64 %t1013, i64 %t1014, i64 %t1015, i64 %t1016, i64 %t1017, i64 %t1018, i64 %t1019, i64 %t1020, i64 %t1021, i64 0)
  store i64 %t1022, ptr %local.rm0.431
  %t1023 = load i64, ptr %local.rm0.431
  %t1024 = load i64, ptr %local.gm0.412
  %t1025 = load i64, ptr %local.gm1.413
  %t1026 = load i64, ptr %local.gm2.414
  %t1027 = load i64, ptr %local.gm3.415
  %t1028 = load i64, ptr %local.go0.404
  %t1029 = load i64, ptr %local.go1.405
  %t1030 = load i64, ptr %local.go2.406
  %t1031 = load i64, ptr %local.go3.407
  %t1032 = load i64, ptr %local.a31
  %t1033 = call i64 @"project_1d"(i64 %t1023, i64 %t1024, i64 %t1025, i64 %t1026, i64 %t1027, i64 %t1028, i64 %t1029, i64 %t1030, i64 %t1031, i64 %t1032, i64 0)
  store i64 %t1033, ptr %local.rm0.431
  %t1034 = load i64, ptr %local.rm0.431
  %t1035 = load i64, ptr %local.gm0.412
  %t1036 = load i64, ptr %local.gm1.413
  %t1037 = load i64, ptr %local.gm2.414
  %t1038 = load i64, ptr %local.gm3.415
  %t1039 = load i64, ptr %local.gb0.408
  %t1040 = load i64, ptr %local.gb1.409
  %t1041 = load i64, ptr %local.gb2.410
  %t1042 = load i64, ptr %local.gb3.411
  %t1043 = load i64, ptr %local.a32
  %t1044 = call i64 @"project_1d"(i64 %t1034, i64 %t1035, i64 %t1036, i64 %t1037, i64 %t1038, i64 %t1039, i64 %t1040, i64 %t1041, i64 %t1042, i64 %t1043, i64 0)
  store i64 %t1044, ptr %local.rm0.431
  %t1045 = load i64, ptr %local.gm1.413
  %t1046 = load i64, ptr %local.gm0.412
  %t1047 = load i64, ptr %local.gm1.413
  %t1048 = load i64, ptr %local.gm2.414
  %t1049 = load i64, ptr %local.gm3.415
  %t1050 = load i64, ptr %local.gl0.400
  %t1051 = load i64, ptr %local.gl1.401
  %t1052 = load i64, ptr %local.gl2.402
  %t1053 = load i64, ptr %local.gl3.403
  %t1054 = load i64, ptr %local.a30
  %t1055 = call i64 @"project_1d"(i64 %t1045, i64 %t1046, i64 %t1047, i64 %t1048, i64 %t1049, i64 %t1050, i64 %t1051, i64 %t1052, i64 %t1053, i64 %t1054, i64 1)
  store i64 %t1055, ptr %local.rm1.432
  %t1056 = load i64, ptr %local.rm1.432
  %t1057 = load i64, ptr %local.gm0.412
  %t1058 = load i64, ptr %local.gm1.413
  %t1059 = load i64, ptr %local.gm2.414
  %t1060 = load i64, ptr %local.gm3.415
  %t1061 = load i64, ptr %local.go0.404
  %t1062 = load i64, ptr %local.go1.405
  %t1063 = load i64, ptr %local.go2.406
  %t1064 = load i64, ptr %local.go3.407
  %t1065 = load i64, ptr %local.a31
  %t1066 = call i64 @"project_1d"(i64 %t1056, i64 %t1057, i64 %t1058, i64 %t1059, i64 %t1060, i64 %t1061, i64 %t1062, i64 %t1063, i64 %t1064, i64 %t1065, i64 1)
  store i64 %t1066, ptr %local.rm1.432
  %t1067 = load i64, ptr %local.rm1.432
  %t1068 = load i64, ptr %local.gm0.412
  %t1069 = load i64, ptr %local.gm1.413
  %t1070 = load i64, ptr %local.gm2.414
  %t1071 = load i64, ptr %local.gm3.415
  %t1072 = load i64, ptr %local.gb0.408
  %t1073 = load i64, ptr %local.gb1.409
  %t1074 = load i64, ptr %local.gb2.410
  %t1075 = load i64, ptr %local.gb3.411
  %t1076 = load i64, ptr %local.a32
  %t1077 = call i64 @"project_1d"(i64 %t1067, i64 %t1068, i64 %t1069, i64 %t1070, i64 %t1071, i64 %t1072, i64 %t1073, i64 %t1074, i64 %t1075, i64 %t1076, i64 1)
  store i64 %t1077, ptr %local.rm1.432
  %t1078 = load i64, ptr %local.gm2.414
  %t1079 = load i64, ptr %local.gm0.412
  %t1080 = load i64, ptr %local.gm1.413
  %t1081 = load i64, ptr %local.gm2.414
  %t1082 = load i64, ptr %local.gm3.415
  %t1083 = load i64, ptr %local.gl0.400
  %t1084 = load i64, ptr %local.gl1.401
  %t1085 = load i64, ptr %local.gl2.402
  %t1086 = load i64, ptr %local.gl3.403
  %t1087 = load i64, ptr %local.a30
  %t1088 = call i64 @"project_1d"(i64 %t1078, i64 %t1079, i64 %t1080, i64 %t1081, i64 %t1082, i64 %t1083, i64 %t1084, i64 %t1085, i64 %t1086, i64 %t1087, i64 2)
  store i64 %t1088, ptr %local.rm2.433
  %t1089 = load i64, ptr %local.rm2.433
  %t1090 = load i64, ptr %local.gm0.412
  %t1091 = load i64, ptr %local.gm1.413
  %t1092 = load i64, ptr %local.gm2.414
  %t1093 = load i64, ptr %local.gm3.415
  %t1094 = load i64, ptr %local.go0.404
  %t1095 = load i64, ptr %local.go1.405
  %t1096 = load i64, ptr %local.go2.406
  %t1097 = load i64, ptr %local.go3.407
  %t1098 = load i64, ptr %local.a31
  %t1099 = call i64 @"project_1d"(i64 %t1089, i64 %t1090, i64 %t1091, i64 %t1092, i64 %t1093, i64 %t1094, i64 %t1095, i64 %t1096, i64 %t1097, i64 %t1098, i64 2)
  store i64 %t1099, ptr %local.rm2.433
  %t1100 = load i64, ptr %local.rm2.433
  %t1101 = load i64, ptr %local.gm0.412
  %t1102 = load i64, ptr %local.gm1.413
  %t1103 = load i64, ptr %local.gm2.414
  %t1104 = load i64, ptr %local.gm3.415
  %t1105 = load i64, ptr %local.gb0.408
  %t1106 = load i64, ptr %local.gb1.409
  %t1107 = load i64, ptr %local.gb2.410
  %t1108 = load i64, ptr %local.gb3.411
  %t1109 = load i64, ptr %local.a32
  %t1110 = call i64 @"project_1d"(i64 %t1100, i64 %t1101, i64 %t1102, i64 %t1103, i64 %t1104, i64 %t1105, i64 %t1106, i64 %t1107, i64 %t1108, i64 %t1109, i64 2)
  store i64 %t1110, ptr %local.rm2.433
  %t1111 = load i64, ptr %local.gm3.415
  %t1112 = load i64, ptr %local.gm0.412
  %t1113 = load i64, ptr %local.gm1.413
  %t1114 = load i64, ptr %local.gm2.414
  %t1115 = load i64, ptr %local.gm3.415
  %t1116 = load i64, ptr %local.gl0.400
  %t1117 = load i64, ptr %local.gl1.401
  %t1118 = load i64, ptr %local.gl2.402
  %t1119 = load i64, ptr %local.gl3.403
  %t1120 = load i64, ptr %local.a30
  %t1121 = call i64 @"project_1d"(i64 %t1111, i64 %t1112, i64 %t1113, i64 %t1114, i64 %t1115, i64 %t1116, i64 %t1117, i64 %t1118, i64 %t1119, i64 %t1120, i64 3)
  store i64 %t1121, ptr %local.rm3.434
  %t1122 = load i64, ptr %local.rm3.434
  %t1123 = load i64, ptr %local.gm0.412
  %t1124 = load i64, ptr %local.gm1.413
  %t1125 = load i64, ptr %local.gm2.414
  %t1126 = load i64, ptr %local.gm3.415
  %t1127 = load i64, ptr %local.go0.404
  %t1128 = load i64, ptr %local.go1.405
  %t1129 = load i64, ptr %local.go2.406
  %t1130 = load i64, ptr %local.go3.407
  %t1131 = load i64, ptr %local.a31
  %t1132 = call i64 @"project_1d"(i64 %t1122, i64 %t1123, i64 %t1124, i64 %t1125, i64 %t1126, i64 %t1127, i64 %t1128, i64 %t1129, i64 %t1130, i64 %t1131, i64 3)
  store i64 %t1132, ptr %local.rm3.434
  %t1133 = load i64, ptr %local.rm3.434
  %t1134 = load i64, ptr %local.gm0.412
  %t1135 = load i64, ptr %local.gm1.413
  %t1136 = load i64, ptr %local.gm2.414
  %t1137 = load i64, ptr %local.gm3.415
  %t1138 = load i64, ptr %local.gb0.408
  %t1139 = load i64, ptr %local.gb1.409
  %t1140 = load i64, ptr %local.gb2.410
  %t1141 = load i64, ptr %local.gb3.411
  %t1142 = load i64, ptr %local.a32
  %t1143 = call i64 @"project_1d"(i64 %t1133, i64 %t1134, i64 %t1135, i64 %t1136, i64 %t1137, i64 %t1138, i64 %t1139, i64 %t1140, i64 %t1141, i64 %t1142, i64 3)
  store i64 %t1143, ptr %local.rm3.434
  %t1144 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.71)
  store i64 %t1144, ptr %local.mem_lr.435
  %t1145 = load i64, ptr %local.w0.392
  %t1146 = load i64, ptr %local.mem_lr.435
  %t1147 = load i64, ptr %local.rm0.431
  %t1148 = call i64 @"sx_f64_mul"(i64 %t1146, i64 %t1147)
  %t1149 = call i64 @"sx_f64_sub"(i64 %t1145, i64 %t1148)
  store i64 %t1149, ptr %local.w0.392
  %t1150 = load i64, ptr %local.w1.393
  %t1151 = load i64, ptr %local.mem_lr.435
  %t1152 = load i64, ptr %local.rm1.432
  %t1153 = call i64 @"sx_f64_mul"(i64 %t1151, i64 %t1152)
  %t1154 = call i64 @"sx_f64_sub"(i64 %t1150, i64 %t1153)
  store i64 %t1154, ptr %local.w1.393
  %t1155 = load i64, ptr %local.w2.394
  %t1156 = load i64, ptr %local.mem_lr.435
  %t1157 = load i64, ptr %local.rm2.433
  %t1158 = call i64 @"sx_f64_mul"(i64 %t1156, i64 %t1157)
  %t1159 = call i64 @"sx_f64_sub"(i64 %t1155, i64 %t1158)
  store i64 %t1159, ptr %local.w2.394
  %t1160 = load i64, ptr %local.w3.395
  %t1161 = load i64, ptr %local.mem_lr.435
  %t1162 = load i64, ptr %local.rm3.434
  %t1163 = call i64 @"sx_f64_mul"(i64 %t1161, i64 %t1162)
  %t1164 = call i64 @"sx_f64_sub"(i64 %t1160, i64 %t1163)
  store i64 %t1164, ptr %local.w3.395
  br label %then23_end
then23_end:
  br label %endif23
else23:
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t1165 = phi i64 [ 0, %then23_end ], [ 0, %else23_end ]
  br label %then22_end
then22_end:
  br label %endif22
else22:
  br label %else22_end
else22_end:
  br label %endif22
endif22:
  %t1166 = phi i64 [ %t1165, %then22_end ], [ 0, %else22_end ]
  %t1167 = load i64, ptr %local.step.396
  %t1168 = icmp sgt i64 %t1167, 0
  %t1169 = zext i1 %t1168 to i64
  %t1170 = icmp ne i64 %t1169, 0
  br i1 %t1170, label %then24, label %else24
then24:
  %t1171 = load i64, ptr %local.step.396
  %t1172 = call i64 @"is_step_multiple"(i64 %t1171, i64 100)
  %t1173 = icmp eq i64 %t1172, 1
  %t1174 = zext i1 %t1173 to i64
  %t1175 = icmp ne i64 %t1174, 0
  br i1 %t1175, label %then25, label %else25
then25:
  %t1176 = load i64, ptr %local.w0.392
  %t1177 = load i64, ptr %local.w1.393
  %t1178 = load i64, ptr %local.w2.394
  %t1179 = load i64, ptr %local.w3.395
  %t1180 = call i64 @"combined_loss"(i64 %t1176, i64 %t1177, i64 %t1178, i64 %t1179)
  store i64 %t1180, ptr %local.cl.436
  %t1181 = load i64, ptr %local.cl.436
  %t1182 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.72)
  %t1183 = call i64 @"sx_f64_gt"(i64 %t1181, i64 %t1182)
  %t1184 = icmp ne i64 %t1183, 0
  br i1 %t1184, label %then26, label %else26
then26:
  %t1185 = load i64, ptr %local.lr.397
  %t1186 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.73)
  %t1187 = call i64 @"sx_f64_mul"(i64 %t1185, i64 %t1186)
  %t1188 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.74)
  %t1189 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.75)
  %t1190 = call i64 @"clamp"(i64 %t1187, i64 %t1188, i64 %t1189)
  store i64 %t1190, ptr %local.lr.397
  br label %then26_end
then26_end:
  br label %endif26
else26:
  %t1191 = load i64, ptr %local.lr.397
  %t1192 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.76)
  %t1193 = call i64 @"sx_f64_mul"(i64 %t1191, i64 %t1192)
  %t1194 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.77)
  %t1195 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.78)
  %t1196 = call i64 @"clamp"(i64 %t1193, i64 %t1194, i64 %t1195)
  store i64 %t1196, ptr %local.lr.397
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t1197 = phi i64 [ 0, %then26_end ], [ 0, %else26_end ]
  br label %then25_end
then25_end:
  br label %endif25
else25:
  br label %else25_end
else25_end:
  br label %endif25
endif25:
  %t1198 = phi i64 [ %t1197, %then25_end ], [ 0, %else25_end ]
  br label %then24_end
then24_end:
  br label %endif24
else24:
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t1199 = phi i64 [ %t1198, %then24_end ], [ 0, %else24_end ]
  %t1200 = load i64, ptr %local.step.396
  %t1201 = add i64 %t1200, 1
  store i64 %t1201, ptr %local.step.396
  br label %loop17
endloop17:
  %t1202 = load i64, ptr %local.w0.392
  %t1203 = load i64, ptr %local.w1.393
  %t1204 = load i64, ptr %local.w2.394
  %t1205 = load i64, ptr %local.w3.395
  %t1206 = call i64 @"combined_loss"(i64 %t1202, i64 %t1203, i64 %t1204, i64 %t1205)
  ret i64 %t1206
}

define i64 @"compute_lyapunov"(i64 %w0, i64 %w1, i64 %w2, i64 %w3) nounwind {
entry:
  %local.ll.1207 = alloca i64
  %local.lo.1208 = alloca i64
  %local.lb.1209 = alloca i64
  %local.lm.1210 = alloca i64
  %local.ll0.1211 = alloca i64
  %local.lo0.1212 = alloca i64
  %local.lb0.1213 = alloca i64
  %local.lm0.1214 = alloca i64
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %t1215 = load i64, ptr %local.w0
  %t1216 = load i64, ptr %local.w1
  %t1217 = load i64, ptr %local.w2
  %t1218 = load i64, ptr %local.w3
  %t1219 = call i64 @"loss_liquid"(i64 %t1215, i64 %t1216, i64 %t1217, i64 %t1218)
  store i64 %t1219, ptr %local.ll.1207
  %t1220 = load i64, ptr %local.w0
  %t1221 = load i64, ptr %local.w1
  %t1222 = load i64, ptr %local.w2
  %t1223 = load i64, ptr %local.w3
  %t1224 = call i64 @"loss_lora"(i64 %t1220, i64 %t1221, i64 %t1222, i64 %t1223)
  store i64 %t1224, ptr %local.lo.1208
  %t1225 = load i64, ptr %local.w0
  %t1226 = load i64, ptr %local.w1
  %t1227 = load i64, ptr %local.w2
  %t1228 = load i64, ptr %local.w3
  %t1229 = call i64 @"loss_belief"(i64 %t1225, i64 %t1226, i64 %t1227, i64 %t1228)
  store i64 %t1229, ptr %local.lb.1209
  %t1230 = load i64, ptr %local.w0
  %t1231 = load i64, ptr %local.w1
  %t1232 = load i64, ptr %local.w2
  %t1233 = load i64, ptr %local.w3
  %t1234 = call i64 @"loss_memory"(i64 %t1230, i64 %t1231, i64 %t1232, i64 %t1233)
  store i64 %t1234, ptr %local.lm.1210
  %t1235 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.79)
  store i64 %t1235, ptr %local.ll0.1211
  %t1236 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.80)
  store i64 %t1236, ptr %local.lo0.1212
  %t1237 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.81)
  store i64 %t1237, ptr %local.lb0.1213
  %t1238 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.82)
  store i64 %t1238, ptr %local.lm0.1214
  %t1239 = load i64, ptr %local.ll.1207
  %t1240 = load i64, ptr %local.ll0.1211
  %t1241 = call i64 @"sx_f64_div"(i64 %t1239, i64 %t1240)
  %t1242 = load i64, ptr %local.lo.1208
  %t1243 = load i64, ptr %local.lo0.1212
  %t1244 = call i64 @"sx_f64_div"(i64 %t1242, i64 %t1243)
  %t1245 = call i64 @"sx_f64_add"(i64 %t1241, i64 %t1244)
  %t1246 = load i64, ptr %local.lb.1209
  %t1247 = load i64, ptr %local.lb0.1213
  %t1248 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.83)
  %t1249 = call i64 @"sx_f64_add"(i64 %t1247, i64 %t1248)
  %t1250 = call i64 @"sx_f64_div"(i64 %t1246, i64 %t1249)
  %t1251 = call i64 @"sx_f64_add"(i64 %t1245, i64 %t1250)
  %t1252 = load i64, ptr %local.lm.1210
  %t1253 = load i64, ptr %local.lm0.1214
  %t1254 = call i64 @"sx_f64_div"(i64 %t1252, i64 %t1253)
  %t1255 = call i64 @"sx_f64_add"(i64 %t1251, i64 %t1254)
  ret i64 %t1255
}

define i64 @"run_inner_lyapunov"(i64 %a01, i64 %a02, i64 %a03, i64 %a10, i64 %a12, i64 %a13, i64 %a20, i64 %a21, i64 %a23, i64 %a30, i64 %a31, i64 %a32, i64 %inner_steps) nounwind {
entry:
  %local.w0.1256 = alloca i64
  %local.w1.1257 = alloca i64
  %local.w2.1258 = alloca i64
  %local.w3.1259 = alloca i64
  %local.step.1260 = alloca i64
  %local.lr.1261 = alloca i64
  %local.confidence.1262 = alloca i64
  %local.mem_strength.1263 = alloca i64
  %local.v_now.1264 = alloca i64
  %local.gl0.1265 = alloca i64
  %local.gl1.1266 = alloca i64
  %local.gl2.1267 = alloca i64
  %local.gl3.1268 = alloca i64
  %local.go0.1269 = alloca i64
  %local.go1.1270 = alloca i64
  %local.go2.1271 = alloca i64
  %local.go3.1272 = alloca i64
  %local.gb0.1273 = alloca i64
  %local.gb1.1274 = alloca i64
  %local.gb2.1275 = alloca i64
  %local.gb3.1276 = alloca i64
  %local.gm0.1277 = alloca i64
  %local.gm1.1278 = alloca i64
  %local.gm2.1279 = alloca i64
  %local.gm3.1280 = alloca i64
  %local.rl0.1281 = alloca i64
  %local.rl1.1282 = alloca i64
  %local.rl2.1283 = alloca i64
  %local.rl3.1284 = alloca i64
  %local.ro0.1285 = alloca i64
  %local.ro1.1286 = alloca i64
  %local.ro2.1287 = alloca i64
  %local.ro3.1288 = alloca i64
  %local.rb0.1289 = alloca i64
  %local.rb1.1290 = alloca i64
  %local.rb2.1291 = alloca i64
  %local.rb3.1292 = alloca i64
  %local.bl.1293 = alloca i64
  %local.rm0.1294 = alloca i64
  %local.rm1.1295 = alloca i64
  %local.rm2.1296 = alloca i64
  %local.rm3.1297 = alloca i64
  %local.cl.1298 = alloca i64
  %local.a01 = alloca i64
  store i64 %a01, ptr %local.a01
  %local.a02 = alloca i64
  store i64 %a02, ptr %local.a02
  %local.a03 = alloca i64
  store i64 %a03, ptr %local.a03
  %local.a10 = alloca i64
  store i64 %a10, ptr %local.a10
  %local.a12 = alloca i64
  store i64 %a12, ptr %local.a12
  %local.a13 = alloca i64
  store i64 %a13, ptr %local.a13
  %local.a20 = alloca i64
  store i64 %a20, ptr %local.a20
  %local.a21 = alloca i64
  store i64 %a21, ptr %local.a21
  %local.a23 = alloca i64
  store i64 %a23, ptr %local.a23
  %local.a30 = alloca i64
  store i64 %a30, ptr %local.a30
  %local.a31 = alloca i64
  store i64 %a31, ptr %local.a31
  %local.a32 = alloca i64
  store i64 %a32, ptr %local.a32
  %local.inner_steps = alloca i64
  store i64 %inner_steps, ptr %local.inner_steps
  %t1299 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.84)
  store i64 %t1299, ptr %local.w0.1256
  %t1300 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.85)
  store i64 %t1300, ptr %local.w1.1257
  %t1301 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.86)
  store i64 %t1301, ptr %local.w2.1258
  %t1302 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.87)
  store i64 %t1302, ptr %local.w3.1259
  store i64 0, ptr %local.step.1260
  %t1303 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.88)
  store i64 %t1303, ptr %local.lr.1261
  %t1304 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.89)
  store i64 %t1304, ptr %local.confidence.1262
  %t1305 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.90)
  store i64 %t1305, ptr %local.mem_strength.1263
  %t1306 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.91)
  store i64 %t1306, ptr %local.v_now.1264
  br label %loop27
loop27:
  %t1307 = load i64, ptr %local.step.1260
  %t1308 = load i64, ptr %local.inner_steps
  %t1309 = icmp slt i64 %t1307, %t1308
  %t1310 = zext i1 %t1309 to i64
  %t1311 = icmp ne i64 %t1310, 0
  br i1 %t1311, label %body27, label %endloop27
body27:
  %t1312 = load i64, ptr %local.w0.1256
  %t1313 = call i64 @"grad_liquid"(i64 %t1312, i64 0)
  store i64 %t1313, ptr %local.gl0.1265
  %t1314 = load i64, ptr %local.w1.1257
  %t1315 = call i64 @"grad_liquid"(i64 %t1314, i64 1)
  store i64 %t1315, ptr %local.gl1.1266
  %t1316 = load i64, ptr %local.w2.1258
  %t1317 = call i64 @"grad_liquid"(i64 %t1316, i64 2)
  store i64 %t1317, ptr %local.gl2.1267
  %t1318 = load i64, ptr %local.w3.1259
  %t1319 = call i64 @"grad_liquid"(i64 %t1318, i64 3)
  store i64 %t1319, ptr %local.gl3.1268
  %t1320 = load i64, ptr %local.w0.1256
  %t1321 = call i64 @"grad_lora"(i64 %t1320, i64 0)
  store i64 %t1321, ptr %local.go0.1269
  %t1322 = load i64, ptr %local.w1.1257
  %t1323 = call i64 @"grad_lora"(i64 %t1322, i64 1)
  store i64 %t1323, ptr %local.go1.1270
  %t1324 = load i64, ptr %local.w2.1258
  %t1325 = call i64 @"grad_lora"(i64 %t1324, i64 2)
  store i64 %t1325, ptr %local.go2.1271
  %t1326 = load i64, ptr %local.w3.1259
  %t1327 = call i64 @"grad_lora"(i64 %t1326, i64 3)
  store i64 %t1327, ptr %local.go3.1272
  %t1328 = load i64, ptr %local.confidence.1262
  %t1329 = load i64, ptr %local.w0.1256
  %t1330 = call i64 @"grad_belief"(i64 %t1329)
  %t1331 = call i64 @"sx_f64_mul"(i64 %t1328, i64 %t1330)
  store i64 %t1331, ptr %local.gb0.1273
  %t1332 = load i64, ptr %local.confidence.1262
  %t1333 = load i64, ptr %local.w1.1257
  %t1334 = call i64 @"grad_belief"(i64 %t1333)
  %t1335 = call i64 @"sx_f64_mul"(i64 %t1332, i64 %t1334)
  store i64 %t1335, ptr %local.gb1.1274
  %t1336 = load i64, ptr %local.confidence.1262
  %t1337 = load i64, ptr %local.w2.1258
  %t1338 = call i64 @"grad_belief"(i64 %t1337)
  %t1339 = call i64 @"sx_f64_mul"(i64 %t1336, i64 %t1338)
  store i64 %t1339, ptr %local.gb2.1275
  %t1340 = load i64, ptr %local.confidence.1262
  %t1341 = load i64, ptr %local.w3.1259
  %t1342 = call i64 @"grad_belief"(i64 %t1341)
  %t1343 = call i64 @"sx_f64_mul"(i64 %t1340, i64 %t1342)
  store i64 %t1343, ptr %local.gb3.1276
  %t1344 = load i64, ptr %local.mem_strength.1263
  %t1345 = load i64, ptr %local.w0.1256
  %t1346 = call i64 @"grad_memory"(i64 %t1345, i64 0)
  %t1347 = call i64 @"sx_f64_mul"(i64 %t1344, i64 %t1346)
  store i64 %t1347, ptr %local.gm0.1277
  %t1348 = load i64, ptr %local.mem_strength.1263
  %t1349 = load i64, ptr %local.w1.1257
  %t1350 = call i64 @"grad_memory"(i64 %t1349, i64 1)
  %t1351 = call i64 @"sx_f64_mul"(i64 %t1348, i64 %t1350)
  store i64 %t1351, ptr %local.gm1.1278
  %t1352 = load i64, ptr %local.mem_strength.1263
  %t1353 = load i64, ptr %local.w2.1258
  %t1354 = call i64 @"grad_memory"(i64 %t1353, i64 2)
  %t1355 = call i64 @"sx_f64_mul"(i64 %t1352, i64 %t1354)
  store i64 %t1355, ptr %local.gm2.1279
  %t1356 = load i64, ptr %local.mem_strength.1263
  %t1357 = load i64, ptr %local.w3.1259
  %t1358 = call i64 @"grad_memory"(i64 %t1357, i64 3)
  %t1359 = call i64 @"sx_f64_mul"(i64 %t1356, i64 %t1358)
  store i64 %t1359, ptr %local.gm3.1280
  %t1360 = load i64, ptr %local.gl0.1265
  %t1361 = load i64, ptr %local.gl0.1265
  %t1362 = load i64, ptr %local.gl1.1266
  %t1363 = load i64, ptr %local.gl2.1267
  %t1364 = load i64, ptr %local.gl3.1268
  %t1365 = load i64, ptr %local.go0.1269
  %t1366 = load i64, ptr %local.go1.1270
  %t1367 = load i64, ptr %local.go2.1271
  %t1368 = load i64, ptr %local.go3.1272
  %t1369 = load i64, ptr %local.a01
  %t1370 = call i64 @"project_1d"(i64 %t1360, i64 %t1361, i64 %t1362, i64 %t1363, i64 %t1364, i64 %t1365, i64 %t1366, i64 %t1367, i64 %t1368, i64 %t1369, i64 0)
  store i64 %t1370, ptr %local.rl0.1281
  %t1371 = load i64, ptr %local.rl0.1281
  %t1372 = load i64, ptr %local.gl0.1265
  %t1373 = load i64, ptr %local.gl1.1266
  %t1374 = load i64, ptr %local.gl2.1267
  %t1375 = load i64, ptr %local.gl3.1268
  %t1376 = load i64, ptr %local.gb0.1273
  %t1377 = load i64, ptr %local.gb1.1274
  %t1378 = load i64, ptr %local.gb2.1275
  %t1379 = load i64, ptr %local.gb3.1276
  %t1380 = load i64, ptr %local.a02
  %t1381 = call i64 @"project_1d"(i64 %t1371, i64 %t1372, i64 %t1373, i64 %t1374, i64 %t1375, i64 %t1376, i64 %t1377, i64 %t1378, i64 %t1379, i64 %t1380, i64 0)
  store i64 %t1381, ptr %local.rl0.1281
  %t1382 = load i64, ptr %local.rl0.1281
  %t1383 = load i64, ptr %local.gl0.1265
  %t1384 = load i64, ptr %local.gl1.1266
  %t1385 = load i64, ptr %local.gl2.1267
  %t1386 = load i64, ptr %local.gl3.1268
  %t1387 = load i64, ptr %local.gm0.1277
  %t1388 = load i64, ptr %local.gm1.1278
  %t1389 = load i64, ptr %local.gm2.1279
  %t1390 = load i64, ptr %local.gm3.1280
  %t1391 = load i64, ptr %local.a03
  %t1392 = call i64 @"project_1d"(i64 %t1382, i64 %t1383, i64 %t1384, i64 %t1385, i64 %t1386, i64 %t1387, i64 %t1388, i64 %t1389, i64 %t1390, i64 %t1391, i64 0)
  store i64 %t1392, ptr %local.rl0.1281
  %t1393 = load i64, ptr %local.gl1.1266
  %t1394 = load i64, ptr %local.gl0.1265
  %t1395 = load i64, ptr %local.gl1.1266
  %t1396 = load i64, ptr %local.gl2.1267
  %t1397 = load i64, ptr %local.gl3.1268
  %t1398 = load i64, ptr %local.go0.1269
  %t1399 = load i64, ptr %local.go1.1270
  %t1400 = load i64, ptr %local.go2.1271
  %t1401 = load i64, ptr %local.go3.1272
  %t1402 = load i64, ptr %local.a01
  %t1403 = call i64 @"project_1d"(i64 %t1393, i64 %t1394, i64 %t1395, i64 %t1396, i64 %t1397, i64 %t1398, i64 %t1399, i64 %t1400, i64 %t1401, i64 %t1402, i64 1)
  store i64 %t1403, ptr %local.rl1.1282
  %t1404 = load i64, ptr %local.rl1.1282
  %t1405 = load i64, ptr %local.gl0.1265
  %t1406 = load i64, ptr %local.gl1.1266
  %t1407 = load i64, ptr %local.gl2.1267
  %t1408 = load i64, ptr %local.gl3.1268
  %t1409 = load i64, ptr %local.gb0.1273
  %t1410 = load i64, ptr %local.gb1.1274
  %t1411 = load i64, ptr %local.gb2.1275
  %t1412 = load i64, ptr %local.gb3.1276
  %t1413 = load i64, ptr %local.a02
  %t1414 = call i64 @"project_1d"(i64 %t1404, i64 %t1405, i64 %t1406, i64 %t1407, i64 %t1408, i64 %t1409, i64 %t1410, i64 %t1411, i64 %t1412, i64 %t1413, i64 1)
  store i64 %t1414, ptr %local.rl1.1282
  %t1415 = load i64, ptr %local.rl1.1282
  %t1416 = load i64, ptr %local.gl0.1265
  %t1417 = load i64, ptr %local.gl1.1266
  %t1418 = load i64, ptr %local.gl2.1267
  %t1419 = load i64, ptr %local.gl3.1268
  %t1420 = load i64, ptr %local.gm0.1277
  %t1421 = load i64, ptr %local.gm1.1278
  %t1422 = load i64, ptr %local.gm2.1279
  %t1423 = load i64, ptr %local.gm3.1280
  %t1424 = load i64, ptr %local.a03
  %t1425 = call i64 @"project_1d"(i64 %t1415, i64 %t1416, i64 %t1417, i64 %t1418, i64 %t1419, i64 %t1420, i64 %t1421, i64 %t1422, i64 %t1423, i64 %t1424, i64 1)
  store i64 %t1425, ptr %local.rl1.1282
  %t1426 = load i64, ptr %local.gl2.1267
  %t1427 = load i64, ptr %local.gl0.1265
  %t1428 = load i64, ptr %local.gl1.1266
  %t1429 = load i64, ptr %local.gl2.1267
  %t1430 = load i64, ptr %local.gl3.1268
  %t1431 = load i64, ptr %local.go0.1269
  %t1432 = load i64, ptr %local.go1.1270
  %t1433 = load i64, ptr %local.go2.1271
  %t1434 = load i64, ptr %local.go3.1272
  %t1435 = load i64, ptr %local.a01
  %t1436 = call i64 @"project_1d"(i64 %t1426, i64 %t1427, i64 %t1428, i64 %t1429, i64 %t1430, i64 %t1431, i64 %t1432, i64 %t1433, i64 %t1434, i64 %t1435, i64 2)
  store i64 %t1436, ptr %local.rl2.1283
  %t1437 = load i64, ptr %local.rl2.1283
  %t1438 = load i64, ptr %local.gl0.1265
  %t1439 = load i64, ptr %local.gl1.1266
  %t1440 = load i64, ptr %local.gl2.1267
  %t1441 = load i64, ptr %local.gl3.1268
  %t1442 = load i64, ptr %local.gb0.1273
  %t1443 = load i64, ptr %local.gb1.1274
  %t1444 = load i64, ptr %local.gb2.1275
  %t1445 = load i64, ptr %local.gb3.1276
  %t1446 = load i64, ptr %local.a02
  %t1447 = call i64 @"project_1d"(i64 %t1437, i64 %t1438, i64 %t1439, i64 %t1440, i64 %t1441, i64 %t1442, i64 %t1443, i64 %t1444, i64 %t1445, i64 %t1446, i64 2)
  store i64 %t1447, ptr %local.rl2.1283
  %t1448 = load i64, ptr %local.rl2.1283
  %t1449 = load i64, ptr %local.gl0.1265
  %t1450 = load i64, ptr %local.gl1.1266
  %t1451 = load i64, ptr %local.gl2.1267
  %t1452 = load i64, ptr %local.gl3.1268
  %t1453 = load i64, ptr %local.gm0.1277
  %t1454 = load i64, ptr %local.gm1.1278
  %t1455 = load i64, ptr %local.gm2.1279
  %t1456 = load i64, ptr %local.gm3.1280
  %t1457 = load i64, ptr %local.a03
  %t1458 = call i64 @"project_1d"(i64 %t1448, i64 %t1449, i64 %t1450, i64 %t1451, i64 %t1452, i64 %t1453, i64 %t1454, i64 %t1455, i64 %t1456, i64 %t1457, i64 2)
  store i64 %t1458, ptr %local.rl2.1283
  %t1459 = load i64, ptr %local.gl3.1268
  %t1460 = load i64, ptr %local.gl0.1265
  %t1461 = load i64, ptr %local.gl1.1266
  %t1462 = load i64, ptr %local.gl2.1267
  %t1463 = load i64, ptr %local.gl3.1268
  %t1464 = load i64, ptr %local.go0.1269
  %t1465 = load i64, ptr %local.go1.1270
  %t1466 = load i64, ptr %local.go2.1271
  %t1467 = load i64, ptr %local.go3.1272
  %t1468 = load i64, ptr %local.a01
  %t1469 = call i64 @"project_1d"(i64 %t1459, i64 %t1460, i64 %t1461, i64 %t1462, i64 %t1463, i64 %t1464, i64 %t1465, i64 %t1466, i64 %t1467, i64 %t1468, i64 3)
  store i64 %t1469, ptr %local.rl3.1284
  %t1470 = load i64, ptr %local.rl3.1284
  %t1471 = load i64, ptr %local.gl0.1265
  %t1472 = load i64, ptr %local.gl1.1266
  %t1473 = load i64, ptr %local.gl2.1267
  %t1474 = load i64, ptr %local.gl3.1268
  %t1475 = load i64, ptr %local.gb0.1273
  %t1476 = load i64, ptr %local.gb1.1274
  %t1477 = load i64, ptr %local.gb2.1275
  %t1478 = load i64, ptr %local.gb3.1276
  %t1479 = load i64, ptr %local.a02
  %t1480 = call i64 @"project_1d"(i64 %t1470, i64 %t1471, i64 %t1472, i64 %t1473, i64 %t1474, i64 %t1475, i64 %t1476, i64 %t1477, i64 %t1478, i64 %t1479, i64 3)
  store i64 %t1480, ptr %local.rl3.1284
  %t1481 = load i64, ptr %local.rl3.1284
  %t1482 = load i64, ptr %local.gl0.1265
  %t1483 = load i64, ptr %local.gl1.1266
  %t1484 = load i64, ptr %local.gl2.1267
  %t1485 = load i64, ptr %local.gl3.1268
  %t1486 = load i64, ptr %local.gm0.1277
  %t1487 = load i64, ptr %local.gm1.1278
  %t1488 = load i64, ptr %local.gm2.1279
  %t1489 = load i64, ptr %local.gm3.1280
  %t1490 = load i64, ptr %local.a03
  %t1491 = call i64 @"project_1d"(i64 %t1481, i64 %t1482, i64 %t1483, i64 %t1484, i64 %t1485, i64 %t1486, i64 %t1487, i64 %t1488, i64 %t1489, i64 %t1490, i64 3)
  store i64 %t1491, ptr %local.rl3.1284
  %t1492 = load i64, ptr %local.w0.1256
  %t1493 = load i64, ptr %local.lr.1261
  %t1494 = load i64, ptr %local.rl0.1281
  %t1495 = call i64 @"sx_f64_mul"(i64 %t1493, i64 %t1494)
  %t1496 = call i64 @"sx_f64_sub"(i64 %t1492, i64 %t1495)
  store i64 %t1496, ptr %local.w0.1256
  %t1497 = load i64, ptr %local.w1.1257
  %t1498 = load i64, ptr %local.lr.1261
  %t1499 = load i64, ptr %local.rl1.1282
  %t1500 = call i64 @"sx_f64_mul"(i64 %t1498, i64 %t1499)
  %t1501 = call i64 @"sx_f64_sub"(i64 %t1497, i64 %t1500)
  store i64 %t1501, ptr %local.w1.1257
  %t1502 = load i64, ptr %local.w2.1258
  %t1503 = load i64, ptr %local.lr.1261
  %t1504 = load i64, ptr %local.rl2.1283
  %t1505 = call i64 @"sx_f64_mul"(i64 %t1503, i64 %t1504)
  %t1506 = call i64 @"sx_f64_sub"(i64 %t1502, i64 %t1505)
  store i64 %t1506, ptr %local.w2.1258
  %t1507 = load i64, ptr %local.w3.1259
  %t1508 = load i64, ptr %local.lr.1261
  %t1509 = load i64, ptr %local.rl3.1284
  %t1510 = call i64 @"sx_f64_mul"(i64 %t1508, i64 %t1509)
  %t1511 = call i64 @"sx_f64_sub"(i64 %t1507, i64 %t1510)
  store i64 %t1511, ptr %local.w3.1259
  %t1512 = load i64, ptr %local.step.1260
  %t1513 = icmp sgt i64 %t1512, 0
  %t1514 = zext i1 %t1513 to i64
  %t1515 = icmp ne i64 %t1514, 0
  br i1 %t1515, label %then28, label %else28
then28:
  %t1516 = load i64, ptr %local.step.1260
  %t1517 = call i64 @"is_step_multiple"(i64 %t1516, i64 10)
  %t1518 = icmp eq i64 %t1517, 1
  %t1519 = zext i1 %t1518 to i64
  %t1520 = icmp ne i64 %t1519, 0
  br i1 %t1520, label %then29, label %else29
then29:
  %t1521 = load i64, ptr %local.go0.1269
  %t1522 = load i64, ptr %local.go0.1269
  %t1523 = load i64, ptr %local.go1.1270
  %t1524 = load i64, ptr %local.go2.1271
  %t1525 = load i64, ptr %local.go3.1272
  %t1526 = load i64, ptr %local.gl0.1265
  %t1527 = load i64, ptr %local.gl1.1266
  %t1528 = load i64, ptr %local.gl2.1267
  %t1529 = load i64, ptr %local.gl3.1268
  %t1530 = load i64, ptr %local.a10
  %t1531 = call i64 @"project_1d"(i64 %t1521, i64 %t1522, i64 %t1523, i64 %t1524, i64 %t1525, i64 %t1526, i64 %t1527, i64 %t1528, i64 %t1529, i64 %t1530, i64 0)
  store i64 %t1531, ptr %local.ro0.1285
  %t1532 = load i64, ptr %local.ro0.1285
  %t1533 = load i64, ptr %local.go0.1269
  %t1534 = load i64, ptr %local.go1.1270
  %t1535 = load i64, ptr %local.go2.1271
  %t1536 = load i64, ptr %local.go3.1272
  %t1537 = load i64, ptr %local.gb0.1273
  %t1538 = load i64, ptr %local.gb1.1274
  %t1539 = load i64, ptr %local.gb2.1275
  %t1540 = load i64, ptr %local.gb3.1276
  %t1541 = load i64, ptr %local.a12
  %t1542 = call i64 @"project_1d"(i64 %t1532, i64 %t1533, i64 %t1534, i64 %t1535, i64 %t1536, i64 %t1537, i64 %t1538, i64 %t1539, i64 %t1540, i64 %t1541, i64 0)
  store i64 %t1542, ptr %local.ro0.1285
  %t1543 = load i64, ptr %local.ro0.1285
  %t1544 = load i64, ptr %local.go0.1269
  %t1545 = load i64, ptr %local.go1.1270
  %t1546 = load i64, ptr %local.go2.1271
  %t1547 = load i64, ptr %local.go3.1272
  %t1548 = load i64, ptr %local.gm0.1277
  %t1549 = load i64, ptr %local.gm1.1278
  %t1550 = load i64, ptr %local.gm2.1279
  %t1551 = load i64, ptr %local.gm3.1280
  %t1552 = load i64, ptr %local.a13
  %t1553 = call i64 @"project_1d"(i64 %t1543, i64 %t1544, i64 %t1545, i64 %t1546, i64 %t1547, i64 %t1548, i64 %t1549, i64 %t1550, i64 %t1551, i64 %t1552, i64 0)
  store i64 %t1553, ptr %local.ro0.1285
  %t1554 = load i64, ptr %local.go1.1270
  %t1555 = load i64, ptr %local.go0.1269
  %t1556 = load i64, ptr %local.go1.1270
  %t1557 = load i64, ptr %local.go2.1271
  %t1558 = load i64, ptr %local.go3.1272
  %t1559 = load i64, ptr %local.gl0.1265
  %t1560 = load i64, ptr %local.gl1.1266
  %t1561 = load i64, ptr %local.gl2.1267
  %t1562 = load i64, ptr %local.gl3.1268
  %t1563 = load i64, ptr %local.a10
  %t1564 = call i64 @"project_1d"(i64 %t1554, i64 %t1555, i64 %t1556, i64 %t1557, i64 %t1558, i64 %t1559, i64 %t1560, i64 %t1561, i64 %t1562, i64 %t1563, i64 1)
  store i64 %t1564, ptr %local.ro1.1286
  %t1565 = load i64, ptr %local.ro1.1286
  %t1566 = load i64, ptr %local.go0.1269
  %t1567 = load i64, ptr %local.go1.1270
  %t1568 = load i64, ptr %local.go2.1271
  %t1569 = load i64, ptr %local.go3.1272
  %t1570 = load i64, ptr %local.gb0.1273
  %t1571 = load i64, ptr %local.gb1.1274
  %t1572 = load i64, ptr %local.gb2.1275
  %t1573 = load i64, ptr %local.gb3.1276
  %t1574 = load i64, ptr %local.a12
  %t1575 = call i64 @"project_1d"(i64 %t1565, i64 %t1566, i64 %t1567, i64 %t1568, i64 %t1569, i64 %t1570, i64 %t1571, i64 %t1572, i64 %t1573, i64 %t1574, i64 1)
  store i64 %t1575, ptr %local.ro1.1286
  %t1576 = load i64, ptr %local.ro1.1286
  %t1577 = load i64, ptr %local.go0.1269
  %t1578 = load i64, ptr %local.go1.1270
  %t1579 = load i64, ptr %local.go2.1271
  %t1580 = load i64, ptr %local.go3.1272
  %t1581 = load i64, ptr %local.gm0.1277
  %t1582 = load i64, ptr %local.gm1.1278
  %t1583 = load i64, ptr %local.gm2.1279
  %t1584 = load i64, ptr %local.gm3.1280
  %t1585 = load i64, ptr %local.a13
  %t1586 = call i64 @"project_1d"(i64 %t1576, i64 %t1577, i64 %t1578, i64 %t1579, i64 %t1580, i64 %t1581, i64 %t1582, i64 %t1583, i64 %t1584, i64 %t1585, i64 1)
  store i64 %t1586, ptr %local.ro1.1286
  %t1587 = load i64, ptr %local.go2.1271
  %t1588 = load i64, ptr %local.go0.1269
  %t1589 = load i64, ptr %local.go1.1270
  %t1590 = load i64, ptr %local.go2.1271
  %t1591 = load i64, ptr %local.go3.1272
  %t1592 = load i64, ptr %local.gl0.1265
  %t1593 = load i64, ptr %local.gl1.1266
  %t1594 = load i64, ptr %local.gl2.1267
  %t1595 = load i64, ptr %local.gl3.1268
  %t1596 = load i64, ptr %local.a10
  %t1597 = call i64 @"project_1d"(i64 %t1587, i64 %t1588, i64 %t1589, i64 %t1590, i64 %t1591, i64 %t1592, i64 %t1593, i64 %t1594, i64 %t1595, i64 %t1596, i64 2)
  store i64 %t1597, ptr %local.ro2.1287
  %t1598 = load i64, ptr %local.ro2.1287
  %t1599 = load i64, ptr %local.go0.1269
  %t1600 = load i64, ptr %local.go1.1270
  %t1601 = load i64, ptr %local.go2.1271
  %t1602 = load i64, ptr %local.go3.1272
  %t1603 = load i64, ptr %local.gb0.1273
  %t1604 = load i64, ptr %local.gb1.1274
  %t1605 = load i64, ptr %local.gb2.1275
  %t1606 = load i64, ptr %local.gb3.1276
  %t1607 = load i64, ptr %local.a12
  %t1608 = call i64 @"project_1d"(i64 %t1598, i64 %t1599, i64 %t1600, i64 %t1601, i64 %t1602, i64 %t1603, i64 %t1604, i64 %t1605, i64 %t1606, i64 %t1607, i64 2)
  store i64 %t1608, ptr %local.ro2.1287
  %t1609 = load i64, ptr %local.ro2.1287
  %t1610 = load i64, ptr %local.go0.1269
  %t1611 = load i64, ptr %local.go1.1270
  %t1612 = load i64, ptr %local.go2.1271
  %t1613 = load i64, ptr %local.go3.1272
  %t1614 = load i64, ptr %local.gm0.1277
  %t1615 = load i64, ptr %local.gm1.1278
  %t1616 = load i64, ptr %local.gm2.1279
  %t1617 = load i64, ptr %local.gm3.1280
  %t1618 = load i64, ptr %local.a13
  %t1619 = call i64 @"project_1d"(i64 %t1609, i64 %t1610, i64 %t1611, i64 %t1612, i64 %t1613, i64 %t1614, i64 %t1615, i64 %t1616, i64 %t1617, i64 %t1618, i64 2)
  store i64 %t1619, ptr %local.ro2.1287
  %t1620 = load i64, ptr %local.go3.1272
  %t1621 = load i64, ptr %local.go0.1269
  %t1622 = load i64, ptr %local.go1.1270
  %t1623 = load i64, ptr %local.go2.1271
  %t1624 = load i64, ptr %local.go3.1272
  %t1625 = load i64, ptr %local.gl0.1265
  %t1626 = load i64, ptr %local.gl1.1266
  %t1627 = load i64, ptr %local.gl2.1267
  %t1628 = load i64, ptr %local.gl3.1268
  %t1629 = load i64, ptr %local.a10
  %t1630 = call i64 @"project_1d"(i64 %t1620, i64 %t1621, i64 %t1622, i64 %t1623, i64 %t1624, i64 %t1625, i64 %t1626, i64 %t1627, i64 %t1628, i64 %t1629, i64 3)
  store i64 %t1630, ptr %local.ro3.1288
  %t1631 = load i64, ptr %local.ro3.1288
  %t1632 = load i64, ptr %local.go0.1269
  %t1633 = load i64, ptr %local.go1.1270
  %t1634 = load i64, ptr %local.go2.1271
  %t1635 = load i64, ptr %local.go3.1272
  %t1636 = load i64, ptr %local.gb0.1273
  %t1637 = load i64, ptr %local.gb1.1274
  %t1638 = load i64, ptr %local.gb2.1275
  %t1639 = load i64, ptr %local.gb3.1276
  %t1640 = load i64, ptr %local.a12
  %t1641 = call i64 @"project_1d"(i64 %t1631, i64 %t1632, i64 %t1633, i64 %t1634, i64 %t1635, i64 %t1636, i64 %t1637, i64 %t1638, i64 %t1639, i64 %t1640, i64 3)
  store i64 %t1641, ptr %local.ro3.1288
  %t1642 = load i64, ptr %local.ro3.1288
  %t1643 = load i64, ptr %local.go0.1269
  %t1644 = load i64, ptr %local.go1.1270
  %t1645 = load i64, ptr %local.go2.1271
  %t1646 = load i64, ptr %local.go3.1272
  %t1647 = load i64, ptr %local.gm0.1277
  %t1648 = load i64, ptr %local.gm1.1278
  %t1649 = load i64, ptr %local.gm2.1279
  %t1650 = load i64, ptr %local.gm3.1280
  %t1651 = load i64, ptr %local.a13
  %t1652 = call i64 @"project_1d"(i64 %t1642, i64 %t1643, i64 %t1644, i64 %t1645, i64 %t1646, i64 %t1647, i64 %t1648, i64 %t1649, i64 %t1650, i64 %t1651, i64 3)
  store i64 %t1652, ptr %local.ro3.1288
  %t1653 = load i64, ptr %local.w0.1256
  %t1654 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.92)
  %t1655 = load i64, ptr %local.ro0.1285
  %t1656 = call i64 @"sx_f64_mul"(i64 %t1654, i64 %t1655)
  %t1657 = call i64 @"sx_f64_sub"(i64 %t1653, i64 %t1656)
  store i64 %t1657, ptr %local.w0.1256
  %t1658 = load i64, ptr %local.w1.1257
  %t1659 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.93)
  %t1660 = load i64, ptr %local.ro1.1286
  %t1661 = call i64 @"sx_f64_mul"(i64 %t1659, i64 %t1660)
  %t1662 = call i64 @"sx_f64_sub"(i64 %t1658, i64 %t1661)
  store i64 %t1662, ptr %local.w1.1257
  %t1663 = load i64, ptr %local.w2.1258
  %t1664 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.94)
  %t1665 = load i64, ptr %local.ro2.1287
  %t1666 = call i64 @"sx_f64_mul"(i64 %t1664, i64 %t1665)
  %t1667 = call i64 @"sx_f64_sub"(i64 %t1663, i64 %t1666)
  store i64 %t1667, ptr %local.w2.1258
  %t1668 = load i64, ptr %local.w3.1259
  %t1669 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.95)
  %t1670 = load i64, ptr %local.ro3.1288
  %t1671 = call i64 @"sx_f64_mul"(i64 %t1669, i64 %t1670)
  %t1672 = call i64 @"sx_f64_sub"(i64 %t1668, i64 %t1671)
  store i64 %t1672, ptr %local.w3.1259
  br label %then29_end
then29_end:
  br label %endif29
else29:
  br label %else29_end
else29_end:
  br label %endif29
endif29:
  %t1673 = phi i64 [ 0, %then29_end ], [ 0, %else29_end ]
  br label %then28_end
then28_end:
  br label %endif28
else28:
  br label %else28_end
else28_end:
  br label %endif28
endif28:
  %t1674 = phi i64 [ %t1673, %then28_end ], [ 0, %else28_end ]
  %t1675 = load i64, ptr %local.step.1260
  %t1676 = icmp sgt i64 %t1675, 0
  %t1677 = zext i1 %t1676 to i64
  %t1678 = icmp ne i64 %t1677, 0
  br i1 %t1678, label %then30, label %else30
then30:
  %t1679 = load i64, ptr %local.step.1260
  %t1680 = call i64 @"is_step_multiple"(i64 %t1679, i64 20)
  %t1681 = icmp eq i64 %t1680, 1
  %t1682 = zext i1 %t1681 to i64
  %t1683 = icmp ne i64 %t1682, 0
  br i1 %t1683, label %then31, label %else31
then31:
  %t1684 = load i64, ptr %local.gb0.1273
  %t1685 = load i64, ptr %local.gb0.1273
  %t1686 = load i64, ptr %local.gb1.1274
  %t1687 = load i64, ptr %local.gb2.1275
  %t1688 = load i64, ptr %local.gb3.1276
  %t1689 = load i64, ptr %local.gl0.1265
  %t1690 = load i64, ptr %local.gl1.1266
  %t1691 = load i64, ptr %local.gl2.1267
  %t1692 = load i64, ptr %local.gl3.1268
  %t1693 = load i64, ptr %local.a20
  %t1694 = call i64 @"project_1d"(i64 %t1684, i64 %t1685, i64 %t1686, i64 %t1687, i64 %t1688, i64 %t1689, i64 %t1690, i64 %t1691, i64 %t1692, i64 %t1693, i64 0)
  store i64 %t1694, ptr %local.rb0.1289
  %t1695 = load i64, ptr %local.rb0.1289
  %t1696 = load i64, ptr %local.gb0.1273
  %t1697 = load i64, ptr %local.gb1.1274
  %t1698 = load i64, ptr %local.gb2.1275
  %t1699 = load i64, ptr %local.gb3.1276
  %t1700 = load i64, ptr %local.go0.1269
  %t1701 = load i64, ptr %local.go1.1270
  %t1702 = load i64, ptr %local.go2.1271
  %t1703 = load i64, ptr %local.go3.1272
  %t1704 = load i64, ptr %local.a21
  %t1705 = call i64 @"project_1d"(i64 %t1695, i64 %t1696, i64 %t1697, i64 %t1698, i64 %t1699, i64 %t1700, i64 %t1701, i64 %t1702, i64 %t1703, i64 %t1704, i64 0)
  store i64 %t1705, ptr %local.rb0.1289
  %t1706 = load i64, ptr %local.rb0.1289
  %t1707 = load i64, ptr %local.gb0.1273
  %t1708 = load i64, ptr %local.gb1.1274
  %t1709 = load i64, ptr %local.gb2.1275
  %t1710 = load i64, ptr %local.gb3.1276
  %t1711 = load i64, ptr %local.gm0.1277
  %t1712 = load i64, ptr %local.gm1.1278
  %t1713 = load i64, ptr %local.gm2.1279
  %t1714 = load i64, ptr %local.gm3.1280
  %t1715 = load i64, ptr %local.a23
  %t1716 = call i64 @"project_1d"(i64 %t1706, i64 %t1707, i64 %t1708, i64 %t1709, i64 %t1710, i64 %t1711, i64 %t1712, i64 %t1713, i64 %t1714, i64 %t1715, i64 0)
  store i64 %t1716, ptr %local.rb0.1289
  %t1717 = load i64, ptr %local.gb1.1274
  %t1718 = load i64, ptr %local.gb0.1273
  %t1719 = load i64, ptr %local.gb1.1274
  %t1720 = load i64, ptr %local.gb2.1275
  %t1721 = load i64, ptr %local.gb3.1276
  %t1722 = load i64, ptr %local.gl0.1265
  %t1723 = load i64, ptr %local.gl1.1266
  %t1724 = load i64, ptr %local.gl2.1267
  %t1725 = load i64, ptr %local.gl3.1268
  %t1726 = load i64, ptr %local.a20
  %t1727 = call i64 @"project_1d"(i64 %t1717, i64 %t1718, i64 %t1719, i64 %t1720, i64 %t1721, i64 %t1722, i64 %t1723, i64 %t1724, i64 %t1725, i64 %t1726, i64 1)
  store i64 %t1727, ptr %local.rb1.1290
  %t1728 = load i64, ptr %local.rb1.1290
  %t1729 = load i64, ptr %local.gb0.1273
  %t1730 = load i64, ptr %local.gb1.1274
  %t1731 = load i64, ptr %local.gb2.1275
  %t1732 = load i64, ptr %local.gb3.1276
  %t1733 = load i64, ptr %local.go0.1269
  %t1734 = load i64, ptr %local.go1.1270
  %t1735 = load i64, ptr %local.go2.1271
  %t1736 = load i64, ptr %local.go3.1272
  %t1737 = load i64, ptr %local.a21
  %t1738 = call i64 @"project_1d"(i64 %t1728, i64 %t1729, i64 %t1730, i64 %t1731, i64 %t1732, i64 %t1733, i64 %t1734, i64 %t1735, i64 %t1736, i64 %t1737, i64 1)
  store i64 %t1738, ptr %local.rb1.1290
  %t1739 = load i64, ptr %local.rb1.1290
  %t1740 = load i64, ptr %local.gb0.1273
  %t1741 = load i64, ptr %local.gb1.1274
  %t1742 = load i64, ptr %local.gb2.1275
  %t1743 = load i64, ptr %local.gb3.1276
  %t1744 = load i64, ptr %local.gm0.1277
  %t1745 = load i64, ptr %local.gm1.1278
  %t1746 = load i64, ptr %local.gm2.1279
  %t1747 = load i64, ptr %local.gm3.1280
  %t1748 = load i64, ptr %local.a23
  %t1749 = call i64 @"project_1d"(i64 %t1739, i64 %t1740, i64 %t1741, i64 %t1742, i64 %t1743, i64 %t1744, i64 %t1745, i64 %t1746, i64 %t1747, i64 %t1748, i64 1)
  store i64 %t1749, ptr %local.rb1.1290
  %t1750 = load i64, ptr %local.gb2.1275
  %t1751 = load i64, ptr %local.gb0.1273
  %t1752 = load i64, ptr %local.gb1.1274
  %t1753 = load i64, ptr %local.gb2.1275
  %t1754 = load i64, ptr %local.gb3.1276
  %t1755 = load i64, ptr %local.gl0.1265
  %t1756 = load i64, ptr %local.gl1.1266
  %t1757 = load i64, ptr %local.gl2.1267
  %t1758 = load i64, ptr %local.gl3.1268
  %t1759 = load i64, ptr %local.a20
  %t1760 = call i64 @"project_1d"(i64 %t1750, i64 %t1751, i64 %t1752, i64 %t1753, i64 %t1754, i64 %t1755, i64 %t1756, i64 %t1757, i64 %t1758, i64 %t1759, i64 2)
  store i64 %t1760, ptr %local.rb2.1291
  %t1761 = load i64, ptr %local.rb2.1291
  %t1762 = load i64, ptr %local.gb0.1273
  %t1763 = load i64, ptr %local.gb1.1274
  %t1764 = load i64, ptr %local.gb2.1275
  %t1765 = load i64, ptr %local.gb3.1276
  %t1766 = load i64, ptr %local.go0.1269
  %t1767 = load i64, ptr %local.go1.1270
  %t1768 = load i64, ptr %local.go2.1271
  %t1769 = load i64, ptr %local.go3.1272
  %t1770 = load i64, ptr %local.a21
  %t1771 = call i64 @"project_1d"(i64 %t1761, i64 %t1762, i64 %t1763, i64 %t1764, i64 %t1765, i64 %t1766, i64 %t1767, i64 %t1768, i64 %t1769, i64 %t1770, i64 2)
  store i64 %t1771, ptr %local.rb2.1291
  %t1772 = load i64, ptr %local.rb2.1291
  %t1773 = load i64, ptr %local.gb0.1273
  %t1774 = load i64, ptr %local.gb1.1274
  %t1775 = load i64, ptr %local.gb2.1275
  %t1776 = load i64, ptr %local.gb3.1276
  %t1777 = load i64, ptr %local.gm0.1277
  %t1778 = load i64, ptr %local.gm1.1278
  %t1779 = load i64, ptr %local.gm2.1279
  %t1780 = load i64, ptr %local.gm3.1280
  %t1781 = load i64, ptr %local.a23
  %t1782 = call i64 @"project_1d"(i64 %t1772, i64 %t1773, i64 %t1774, i64 %t1775, i64 %t1776, i64 %t1777, i64 %t1778, i64 %t1779, i64 %t1780, i64 %t1781, i64 2)
  store i64 %t1782, ptr %local.rb2.1291
  %t1783 = load i64, ptr %local.gb3.1276
  %t1784 = load i64, ptr %local.gb0.1273
  %t1785 = load i64, ptr %local.gb1.1274
  %t1786 = load i64, ptr %local.gb2.1275
  %t1787 = load i64, ptr %local.gb3.1276
  %t1788 = load i64, ptr %local.gl0.1265
  %t1789 = load i64, ptr %local.gl1.1266
  %t1790 = load i64, ptr %local.gl2.1267
  %t1791 = load i64, ptr %local.gl3.1268
  %t1792 = load i64, ptr %local.a20
  %t1793 = call i64 @"project_1d"(i64 %t1783, i64 %t1784, i64 %t1785, i64 %t1786, i64 %t1787, i64 %t1788, i64 %t1789, i64 %t1790, i64 %t1791, i64 %t1792, i64 3)
  store i64 %t1793, ptr %local.rb3.1292
  %t1794 = load i64, ptr %local.rb3.1292
  %t1795 = load i64, ptr %local.gb0.1273
  %t1796 = load i64, ptr %local.gb1.1274
  %t1797 = load i64, ptr %local.gb2.1275
  %t1798 = load i64, ptr %local.gb3.1276
  %t1799 = load i64, ptr %local.go0.1269
  %t1800 = load i64, ptr %local.go1.1270
  %t1801 = load i64, ptr %local.go2.1271
  %t1802 = load i64, ptr %local.go3.1272
  %t1803 = load i64, ptr %local.a21
  %t1804 = call i64 @"project_1d"(i64 %t1794, i64 %t1795, i64 %t1796, i64 %t1797, i64 %t1798, i64 %t1799, i64 %t1800, i64 %t1801, i64 %t1802, i64 %t1803, i64 3)
  store i64 %t1804, ptr %local.rb3.1292
  %t1805 = load i64, ptr %local.rb3.1292
  %t1806 = load i64, ptr %local.gb0.1273
  %t1807 = load i64, ptr %local.gb1.1274
  %t1808 = load i64, ptr %local.gb2.1275
  %t1809 = load i64, ptr %local.gb3.1276
  %t1810 = load i64, ptr %local.gm0.1277
  %t1811 = load i64, ptr %local.gm1.1278
  %t1812 = load i64, ptr %local.gm2.1279
  %t1813 = load i64, ptr %local.gm3.1280
  %t1814 = load i64, ptr %local.a23
  %t1815 = call i64 @"project_1d"(i64 %t1805, i64 %t1806, i64 %t1807, i64 %t1808, i64 %t1809, i64 %t1810, i64 %t1811, i64 %t1812, i64 %t1813, i64 %t1814, i64 3)
  store i64 %t1815, ptr %local.rb3.1292
  %t1816 = load i64, ptr %local.w0.1256
  %t1817 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.96)
  %t1818 = load i64, ptr %local.rb0.1289
  %t1819 = call i64 @"sx_f64_mul"(i64 %t1817, i64 %t1818)
  %t1820 = call i64 @"sx_f64_sub"(i64 %t1816, i64 %t1819)
  store i64 %t1820, ptr %local.w0.1256
  %t1821 = load i64, ptr %local.w1.1257
  %t1822 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.97)
  %t1823 = load i64, ptr %local.rb1.1290
  %t1824 = call i64 @"sx_f64_mul"(i64 %t1822, i64 %t1823)
  %t1825 = call i64 @"sx_f64_sub"(i64 %t1821, i64 %t1824)
  store i64 %t1825, ptr %local.w1.1257
  %t1826 = load i64, ptr %local.w2.1258
  %t1827 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.98)
  %t1828 = load i64, ptr %local.rb2.1291
  %t1829 = call i64 @"sx_f64_mul"(i64 %t1827, i64 %t1828)
  %t1830 = call i64 @"sx_f64_sub"(i64 %t1826, i64 %t1829)
  store i64 %t1830, ptr %local.w2.1258
  %t1831 = load i64, ptr %local.w3.1259
  %t1832 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.99)
  %t1833 = load i64, ptr %local.rb3.1292
  %t1834 = call i64 @"sx_f64_mul"(i64 %t1832, i64 %t1833)
  %t1835 = call i64 @"sx_f64_sub"(i64 %t1831, i64 %t1834)
  store i64 %t1835, ptr %local.w3.1259
  %t1836 = load i64, ptr %local.w0.1256
  %t1837 = load i64, ptr %local.w1.1257
  %t1838 = load i64, ptr %local.w2.1258
  %t1839 = load i64, ptr %local.w3.1259
  %t1840 = call i64 @"loss_belief"(i64 %t1836, i64 %t1837, i64 %t1838, i64 %t1839)
  store i64 %t1840, ptr %local.bl.1293
  %t1841 = load i64, ptr %local.confidence.1262
  %t1842 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.100)
  %t1843 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.101)
  %t1844 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.102)
  %t1845 = load i64, ptr %local.bl.1293
  %t1846 = call i64 @"sx_f64_add"(i64 %t1844, i64 %t1845)
  %t1847 = call i64 @"sx_f64_div"(i64 %t1843, i64 %t1846)
  %t1848 = load i64, ptr %local.confidence.1262
  %t1849 = call i64 @"sx_f64_sub"(i64 %t1847, i64 %t1848)
  %t1850 = call i64 @"sx_f64_mul"(i64 %t1842, i64 %t1849)
  %t1851 = call i64 @"sx_f64_add"(i64 %t1841, i64 %t1850)
  store i64 %t1851, ptr %local.confidence.1262
  %t1852 = load i64, ptr %local.confidence.1262
  %t1853 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.103)
  %t1854 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.104)
  %t1855 = call i64 @"clamp"(i64 %t1852, i64 %t1853, i64 %t1854)
  store i64 %t1855, ptr %local.confidence.1262
  br label %then31_end
then31_end:
  br label %endif31
else31:
  br label %else31_end
else31_end:
  br label %endif31
endif31:
  %t1856 = phi i64 [ 0, %then31_end ], [ 0, %else31_end ]
  br label %then30_end
then30_end:
  br label %endif30
else30:
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t1857 = phi i64 [ %t1856, %then30_end ], [ 0, %else30_end ]
  %t1858 = load i64, ptr %local.step.1260
  %t1859 = icmp sgt i64 %t1858, 0
  %t1860 = zext i1 %t1859 to i64
  %t1861 = icmp ne i64 %t1860, 0
  br i1 %t1861, label %then32, label %else32
then32:
  %t1862 = load i64, ptr %local.step.1260
  %t1863 = call i64 @"is_step_multiple"(i64 %t1862, i64 50)
  %t1864 = icmp eq i64 %t1863, 1
  %t1865 = zext i1 %t1864 to i64
  %t1866 = icmp ne i64 %t1865, 0
  br i1 %t1866, label %then33, label %else33
then33:
  %t1867 = load i64, ptr %local.mem_strength.1263
  %t1868 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.105)
  %t1869 = call i64 @"sx_f64_add"(i64 %t1867, i64 %t1868)
  %t1870 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.106)
  %t1871 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.107)
  %t1872 = call i64 @"clamp"(i64 %t1869, i64 %t1870, i64 %t1871)
  store i64 %t1872, ptr %local.mem_strength.1263
  %t1873 = load i64, ptr %local.gm0.1277
  %t1874 = load i64, ptr %local.gm0.1277
  %t1875 = load i64, ptr %local.gm1.1278
  %t1876 = load i64, ptr %local.gm2.1279
  %t1877 = load i64, ptr %local.gm3.1280
  %t1878 = load i64, ptr %local.gl0.1265
  %t1879 = load i64, ptr %local.gl1.1266
  %t1880 = load i64, ptr %local.gl2.1267
  %t1881 = load i64, ptr %local.gl3.1268
  %t1882 = load i64, ptr %local.a30
  %t1883 = call i64 @"project_1d"(i64 %t1873, i64 %t1874, i64 %t1875, i64 %t1876, i64 %t1877, i64 %t1878, i64 %t1879, i64 %t1880, i64 %t1881, i64 %t1882, i64 0)
  store i64 %t1883, ptr %local.rm0.1294
  %t1884 = load i64, ptr %local.rm0.1294
  %t1885 = load i64, ptr %local.gm0.1277
  %t1886 = load i64, ptr %local.gm1.1278
  %t1887 = load i64, ptr %local.gm2.1279
  %t1888 = load i64, ptr %local.gm3.1280
  %t1889 = load i64, ptr %local.go0.1269
  %t1890 = load i64, ptr %local.go1.1270
  %t1891 = load i64, ptr %local.go2.1271
  %t1892 = load i64, ptr %local.go3.1272
  %t1893 = load i64, ptr %local.a31
  %t1894 = call i64 @"project_1d"(i64 %t1884, i64 %t1885, i64 %t1886, i64 %t1887, i64 %t1888, i64 %t1889, i64 %t1890, i64 %t1891, i64 %t1892, i64 %t1893, i64 0)
  store i64 %t1894, ptr %local.rm0.1294
  %t1895 = load i64, ptr %local.rm0.1294
  %t1896 = load i64, ptr %local.gm0.1277
  %t1897 = load i64, ptr %local.gm1.1278
  %t1898 = load i64, ptr %local.gm2.1279
  %t1899 = load i64, ptr %local.gm3.1280
  %t1900 = load i64, ptr %local.gb0.1273
  %t1901 = load i64, ptr %local.gb1.1274
  %t1902 = load i64, ptr %local.gb2.1275
  %t1903 = load i64, ptr %local.gb3.1276
  %t1904 = load i64, ptr %local.a32
  %t1905 = call i64 @"project_1d"(i64 %t1895, i64 %t1896, i64 %t1897, i64 %t1898, i64 %t1899, i64 %t1900, i64 %t1901, i64 %t1902, i64 %t1903, i64 %t1904, i64 0)
  store i64 %t1905, ptr %local.rm0.1294
  %t1906 = load i64, ptr %local.gm1.1278
  %t1907 = load i64, ptr %local.gm0.1277
  %t1908 = load i64, ptr %local.gm1.1278
  %t1909 = load i64, ptr %local.gm2.1279
  %t1910 = load i64, ptr %local.gm3.1280
  %t1911 = load i64, ptr %local.gl0.1265
  %t1912 = load i64, ptr %local.gl1.1266
  %t1913 = load i64, ptr %local.gl2.1267
  %t1914 = load i64, ptr %local.gl3.1268
  %t1915 = load i64, ptr %local.a30
  %t1916 = call i64 @"project_1d"(i64 %t1906, i64 %t1907, i64 %t1908, i64 %t1909, i64 %t1910, i64 %t1911, i64 %t1912, i64 %t1913, i64 %t1914, i64 %t1915, i64 1)
  store i64 %t1916, ptr %local.rm1.1295
  %t1917 = load i64, ptr %local.rm1.1295
  %t1918 = load i64, ptr %local.gm0.1277
  %t1919 = load i64, ptr %local.gm1.1278
  %t1920 = load i64, ptr %local.gm2.1279
  %t1921 = load i64, ptr %local.gm3.1280
  %t1922 = load i64, ptr %local.go0.1269
  %t1923 = load i64, ptr %local.go1.1270
  %t1924 = load i64, ptr %local.go2.1271
  %t1925 = load i64, ptr %local.go3.1272
  %t1926 = load i64, ptr %local.a31
  %t1927 = call i64 @"project_1d"(i64 %t1917, i64 %t1918, i64 %t1919, i64 %t1920, i64 %t1921, i64 %t1922, i64 %t1923, i64 %t1924, i64 %t1925, i64 %t1926, i64 1)
  store i64 %t1927, ptr %local.rm1.1295
  %t1928 = load i64, ptr %local.rm1.1295
  %t1929 = load i64, ptr %local.gm0.1277
  %t1930 = load i64, ptr %local.gm1.1278
  %t1931 = load i64, ptr %local.gm2.1279
  %t1932 = load i64, ptr %local.gm3.1280
  %t1933 = load i64, ptr %local.gb0.1273
  %t1934 = load i64, ptr %local.gb1.1274
  %t1935 = load i64, ptr %local.gb2.1275
  %t1936 = load i64, ptr %local.gb3.1276
  %t1937 = load i64, ptr %local.a32
  %t1938 = call i64 @"project_1d"(i64 %t1928, i64 %t1929, i64 %t1930, i64 %t1931, i64 %t1932, i64 %t1933, i64 %t1934, i64 %t1935, i64 %t1936, i64 %t1937, i64 1)
  store i64 %t1938, ptr %local.rm1.1295
  %t1939 = load i64, ptr %local.gm2.1279
  %t1940 = load i64, ptr %local.gm0.1277
  %t1941 = load i64, ptr %local.gm1.1278
  %t1942 = load i64, ptr %local.gm2.1279
  %t1943 = load i64, ptr %local.gm3.1280
  %t1944 = load i64, ptr %local.gl0.1265
  %t1945 = load i64, ptr %local.gl1.1266
  %t1946 = load i64, ptr %local.gl2.1267
  %t1947 = load i64, ptr %local.gl3.1268
  %t1948 = load i64, ptr %local.a30
  %t1949 = call i64 @"project_1d"(i64 %t1939, i64 %t1940, i64 %t1941, i64 %t1942, i64 %t1943, i64 %t1944, i64 %t1945, i64 %t1946, i64 %t1947, i64 %t1948, i64 2)
  store i64 %t1949, ptr %local.rm2.1296
  %t1950 = load i64, ptr %local.rm2.1296
  %t1951 = load i64, ptr %local.gm0.1277
  %t1952 = load i64, ptr %local.gm1.1278
  %t1953 = load i64, ptr %local.gm2.1279
  %t1954 = load i64, ptr %local.gm3.1280
  %t1955 = load i64, ptr %local.go0.1269
  %t1956 = load i64, ptr %local.go1.1270
  %t1957 = load i64, ptr %local.go2.1271
  %t1958 = load i64, ptr %local.go3.1272
  %t1959 = load i64, ptr %local.a31
  %t1960 = call i64 @"project_1d"(i64 %t1950, i64 %t1951, i64 %t1952, i64 %t1953, i64 %t1954, i64 %t1955, i64 %t1956, i64 %t1957, i64 %t1958, i64 %t1959, i64 2)
  store i64 %t1960, ptr %local.rm2.1296
  %t1961 = load i64, ptr %local.rm2.1296
  %t1962 = load i64, ptr %local.gm0.1277
  %t1963 = load i64, ptr %local.gm1.1278
  %t1964 = load i64, ptr %local.gm2.1279
  %t1965 = load i64, ptr %local.gm3.1280
  %t1966 = load i64, ptr %local.gb0.1273
  %t1967 = load i64, ptr %local.gb1.1274
  %t1968 = load i64, ptr %local.gb2.1275
  %t1969 = load i64, ptr %local.gb3.1276
  %t1970 = load i64, ptr %local.a32
  %t1971 = call i64 @"project_1d"(i64 %t1961, i64 %t1962, i64 %t1963, i64 %t1964, i64 %t1965, i64 %t1966, i64 %t1967, i64 %t1968, i64 %t1969, i64 %t1970, i64 2)
  store i64 %t1971, ptr %local.rm2.1296
  %t1972 = load i64, ptr %local.gm3.1280
  %t1973 = load i64, ptr %local.gm0.1277
  %t1974 = load i64, ptr %local.gm1.1278
  %t1975 = load i64, ptr %local.gm2.1279
  %t1976 = load i64, ptr %local.gm3.1280
  %t1977 = load i64, ptr %local.gl0.1265
  %t1978 = load i64, ptr %local.gl1.1266
  %t1979 = load i64, ptr %local.gl2.1267
  %t1980 = load i64, ptr %local.gl3.1268
  %t1981 = load i64, ptr %local.a30
  %t1982 = call i64 @"project_1d"(i64 %t1972, i64 %t1973, i64 %t1974, i64 %t1975, i64 %t1976, i64 %t1977, i64 %t1978, i64 %t1979, i64 %t1980, i64 %t1981, i64 3)
  store i64 %t1982, ptr %local.rm3.1297
  %t1983 = load i64, ptr %local.rm3.1297
  %t1984 = load i64, ptr %local.gm0.1277
  %t1985 = load i64, ptr %local.gm1.1278
  %t1986 = load i64, ptr %local.gm2.1279
  %t1987 = load i64, ptr %local.gm3.1280
  %t1988 = load i64, ptr %local.go0.1269
  %t1989 = load i64, ptr %local.go1.1270
  %t1990 = load i64, ptr %local.go2.1271
  %t1991 = load i64, ptr %local.go3.1272
  %t1992 = load i64, ptr %local.a31
  %t1993 = call i64 @"project_1d"(i64 %t1983, i64 %t1984, i64 %t1985, i64 %t1986, i64 %t1987, i64 %t1988, i64 %t1989, i64 %t1990, i64 %t1991, i64 %t1992, i64 3)
  store i64 %t1993, ptr %local.rm3.1297
  %t1994 = load i64, ptr %local.rm3.1297
  %t1995 = load i64, ptr %local.gm0.1277
  %t1996 = load i64, ptr %local.gm1.1278
  %t1997 = load i64, ptr %local.gm2.1279
  %t1998 = load i64, ptr %local.gm3.1280
  %t1999 = load i64, ptr %local.gb0.1273
  %t2000 = load i64, ptr %local.gb1.1274
  %t2001 = load i64, ptr %local.gb2.1275
  %t2002 = load i64, ptr %local.gb3.1276
  %t2003 = load i64, ptr %local.a32
  %t2004 = call i64 @"project_1d"(i64 %t1994, i64 %t1995, i64 %t1996, i64 %t1997, i64 %t1998, i64 %t1999, i64 %t2000, i64 %t2001, i64 %t2002, i64 %t2003, i64 3)
  store i64 %t2004, ptr %local.rm3.1297
  %t2005 = load i64, ptr %local.w0.1256
  %t2006 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.108)
  %t2007 = load i64, ptr %local.rm0.1294
  %t2008 = call i64 @"sx_f64_mul"(i64 %t2006, i64 %t2007)
  %t2009 = call i64 @"sx_f64_sub"(i64 %t2005, i64 %t2008)
  store i64 %t2009, ptr %local.w0.1256
  %t2010 = load i64, ptr %local.w1.1257
  %t2011 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.109)
  %t2012 = load i64, ptr %local.rm1.1295
  %t2013 = call i64 @"sx_f64_mul"(i64 %t2011, i64 %t2012)
  %t2014 = call i64 @"sx_f64_sub"(i64 %t2010, i64 %t2013)
  store i64 %t2014, ptr %local.w1.1257
  %t2015 = load i64, ptr %local.w2.1258
  %t2016 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.110)
  %t2017 = load i64, ptr %local.rm2.1296
  %t2018 = call i64 @"sx_f64_mul"(i64 %t2016, i64 %t2017)
  %t2019 = call i64 @"sx_f64_sub"(i64 %t2015, i64 %t2018)
  store i64 %t2019, ptr %local.w2.1258
  %t2020 = load i64, ptr %local.w3.1259
  %t2021 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.111)
  %t2022 = load i64, ptr %local.rm3.1297
  %t2023 = call i64 @"sx_f64_mul"(i64 %t2021, i64 %t2022)
  %t2024 = call i64 @"sx_f64_sub"(i64 %t2020, i64 %t2023)
  store i64 %t2024, ptr %local.w3.1259
  br label %then33_end
then33_end:
  br label %endif33
else33:
  br label %else33_end
else33_end:
  br label %endif33
endif33:
  %t2025 = phi i64 [ 0, %then33_end ], [ 0, %else33_end ]
  br label %then32_end
then32_end:
  br label %endif32
else32:
  br label %else32_end
else32_end:
  br label %endif32
endif32:
  %t2026 = phi i64 [ %t2025, %then32_end ], [ 0, %else32_end ]
  %t2027 = load i64, ptr %local.step.1260
  %t2028 = icmp sgt i64 %t2027, 0
  %t2029 = zext i1 %t2028 to i64
  %t2030 = icmp ne i64 %t2029, 0
  br i1 %t2030, label %then34, label %else34
then34:
  %t2031 = load i64, ptr %local.step.1260
  %t2032 = call i64 @"is_step_multiple"(i64 %t2031, i64 100)
  %t2033 = icmp eq i64 %t2032, 1
  %t2034 = zext i1 %t2033 to i64
  %t2035 = icmp ne i64 %t2034, 0
  br i1 %t2035, label %then35, label %else35
then35:
  %t2036 = load i64, ptr %local.w0.1256
  %t2037 = load i64, ptr %local.w1.1257
  %t2038 = load i64, ptr %local.w2.1258
  %t2039 = load i64, ptr %local.w3.1259
  %t2040 = call i64 @"combined_loss"(i64 %t2036, i64 %t2037, i64 %t2038, i64 %t2039)
  store i64 %t2040, ptr %local.cl.1298
  %t2041 = load i64, ptr %local.cl.1298
  %t2042 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.112)
  %t2043 = call i64 @"sx_f64_gt"(i64 %t2041, i64 %t2042)
  %t2044 = icmp ne i64 %t2043, 0
  br i1 %t2044, label %then36, label %else36
then36:
  %t2045 = load i64, ptr %local.lr.1261
  %t2046 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.113)
  %t2047 = call i64 @"sx_f64_mul"(i64 %t2045, i64 %t2046)
  %t2048 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.114)
  %t2049 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.115)
  %t2050 = call i64 @"clamp"(i64 %t2047, i64 %t2048, i64 %t2049)
  store i64 %t2050, ptr %local.lr.1261
  br label %then36_end
then36_end:
  br label %endif36
else36:
  %t2051 = load i64, ptr %local.lr.1261
  %t2052 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.116)
  %t2053 = call i64 @"sx_f64_mul"(i64 %t2051, i64 %t2052)
  %t2054 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.117)
  %t2055 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.118)
  %t2056 = call i64 @"clamp"(i64 %t2053, i64 %t2054, i64 %t2055)
  store i64 %t2056, ptr %local.lr.1261
  br label %else36_end
else36_end:
  br label %endif36
endif36:
  %t2057 = phi i64 [ 0, %then36_end ], [ 0, %else36_end ]
  br label %then35_end
then35_end:
  br label %endif35
else35:
  br label %else35_end
else35_end:
  br label %endif35
endif35:
  %t2058 = phi i64 [ %t2057, %then35_end ], [ 0, %else35_end ]
  br label %then34_end
then34_end:
  br label %endif34
else34:
  br label %else34_end
else34_end:
  br label %endif34
endif34:
  %t2059 = phi i64 [ %t2058, %then34_end ], [ 0, %else34_end ]
  %t2060 = load i64, ptr %local.step.1260
  %t2061 = add i64 %t2060, 1
  store i64 %t2061, ptr %local.step.1260
  br label %loop27
endloop27:
  %t2062 = load i64, ptr %local.w0.1256
  %t2063 = load i64, ptr %local.w1.1257
  %t2064 = load i64, ptr %local.w2.1258
  %t2065 = load i64, ptr %local.w3.1259
  %t2066 = call i64 @"compute_lyapunov"(i64 %t2062, i64 %t2063, i64 %t2064, i64 %t2065)
  ret i64 %t2066
}

define i64 @"meta_grad"(i64 %a01, i64 %a02, i64 %a03, i64 %a10, i64 %a12, i64 %a13, i64 %a20, i64 %a21, i64 %a23, i64 %a30, i64 %a31, i64 %a32, i64 %which, i64 %steps) nounwind {
entry:
  %local.h.2067 = alloca i64
  %local.p01.2068 = alloca i64
  %local.p02.2069 = alloca i64
  %local.p03.2070 = alloca i64
  %local.p10.2071 = alloca i64
  %local.p12.2072 = alloca i64
  %local.p13.2073 = alloca i64
  %local.p20.2074 = alloca i64
  %local.p21.2075 = alloca i64
  %local.p23.2076 = alloca i64
  %local.p30.2077 = alloca i64
  %local.p31.2078 = alloca i64
  %local.p32.2079 = alloca i64
  %local.m01.2080 = alloca i64
  %local.m02.2081 = alloca i64
  %local.m03.2082 = alloca i64
  %local.m10.2083 = alloca i64
  %local.m12.2084 = alloca i64
  %local.m13.2085 = alloca i64
  %local.m20.2086 = alloca i64
  %local.m21.2087 = alloca i64
  %local.m23.2088 = alloca i64
  %local.m30.2089 = alloca i64
  %local.m31.2090 = alloca i64
  %local.m32.2091 = alloca i64
  %local.lp.2092 = alloca i64
  %local.lm.2093 = alloca i64
  %local.a01 = alloca i64
  store i64 %a01, ptr %local.a01
  %local.a02 = alloca i64
  store i64 %a02, ptr %local.a02
  %local.a03 = alloca i64
  store i64 %a03, ptr %local.a03
  %local.a10 = alloca i64
  store i64 %a10, ptr %local.a10
  %local.a12 = alloca i64
  store i64 %a12, ptr %local.a12
  %local.a13 = alloca i64
  store i64 %a13, ptr %local.a13
  %local.a20 = alloca i64
  store i64 %a20, ptr %local.a20
  %local.a21 = alloca i64
  store i64 %a21, ptr %local.a21
  %local.a23 = alloca i64
  store i64 %a23, ptr %local.a23
  %local.a30 = alloca i64
  store i64 %a30, ptr %local.a30
  %local.a31 = alloca i64
  store i64 %a31, ptr %local.a31
  %local.a32 = alloca i64
  store i64 %a32, ptr %local.a32
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %t2094 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.119)
  store i64 %t2094, ptr %local.h.2067
  %t2095 = load i64, ptr %local.a01
  store i64 %t2095, ptr %local.p01.2068
  %t2096 = load i64, ptr %local.a02
  store i64 %t2096, ptr %local.p02.2069
  %t2097 = load i64, ptr %local.a03
  store i64 %t2097, ptr %local.p03.2070
  %t2098 = load i64, ptr %local.a10
  store i64 %t2098, ptr %local.p10.2071
  %t2099 = load i64, ptr %local.a12
  store i64 %t2099, ptr %local.p12.2072
  %t2100 = load i64, ptr %local.a13
  store i64 %t2100, ptr %local.p13.2073
  %t2101 = load i64, ptr %local.a20
  store i64 %t2101, ptr %local.p20.2074
  %t2102 = load i64, ptr %local.a21
  store i64 %t2102, ptr %local.p21.2075
  %t2103 = load i64, ptr %local.a23
  store i64 %t2103, ptr %local.p23.2076
  %t2104 = load i64, ptr %local.a30
  store i64 %t2104, ptr %local.p30.2077
  %t2105 = load i64, ptr %local.a31
  store i64 %t2105, ptr %local.p31.2078
  %t2106 = load i64, ptr %local.a32
  store i64 %t2106, ptr %local.p32.2079
  %t2107 = load i64, ptr %local.a01
  store i64 %t2107, ptr %local.m01.2080
  %t2108 = load i64, ptr %local.a02
  store i64 %t2108, ptr %local.m02.2081
  %t2109 = load i64, ptr %local.a03
  store i64 %t2109, ptr %local.m03.2082
  %t2110 = load i64, ptr %local.a10
  store i64 %t2110, ptr %local.m10.2083
  %t2111 = load i64, ptr %local.a12
  store i64 %t2111, ptr %local.m12.2084
  %t2112 = load i64, ptr %local.a13
  store i64 %t2112, ptr %local.m13.2085
  %t2113 = load i64, ptr %local.a20
  store i64 %t2113, ptr %local.m20.2086
  %t2114 = load i64, ptr %local.a21
  store i64 %t2114, ptr %local.m21.2087
  %t2115 = load i64, ptr %local.a23
  store i64 %t2115, ptr %local.m23.2088
  %t2116 = load i64, ptr %local.a30
  store i64 %t2116, ptr %local.m30.2089
  %t2117 = load i64, ptr %local.a31
  store i64 %t2117, ptr %local.m31.2090
  %t2118 = load i64, ptr %local.a32
  store i64 %t2118, ptr %local.m32.2091
  %t2119 = load i64, ptr %local.which
  %t2120 = icmp eq i64 %t2119, 0
  %t2121 = zext i1 %t2120 to i64
  %t2122 = icmp ne i64 %t2121, 0
  br i1 %t2122, label %then37, label %else37
then37:
  %t2123 = load i64, ptr %local.a01
  %t2124 = load i64, ptr %local.h.2067
  %t2125 = call i64 @"sx_f64_add"(i64 %t2123, i64 %t2124)
  store i64 %t2125, ptr %local.p01.2068
  %t2126 = load i64, ptr %local.a01
  %t2127 = load i64, ptr %local.h.2067
  %t2128 = call i64 @"sx_f64_sub"(i64 %t2126, i64 %t2127)
  store i64 %t2128, ptr %local.m01.2080
  br label %then37_end
then37_end:
  br label %endif37
else37:
  br label %else37_end
else37_end:
  br label %endif37
endif37:
  %t2129 = phi i64 [ 0, %then37_end ], [ 0, %else37_end ]
  %t2130 = load i64, ptr %local.which
  %t2131 = icmp eq i64 %t2130, 1
  %t2132 = zext i1 %t2131 to i64
  %t2133 = icmp ne i64 %t2132, 0
  br i1 %t2133, label %then38, label %else38
then38:
  %t2134 = load i64, ptr %local.a02
  %t2135 = load i64, ptr %local.h.2067
  %t2136 = call i64 @"sx_f64_add"(i64 %t2134, i64 %t2135)
  store i64 %t2136, ptr %local.p02.2069
  %t2137 = load i64, ptr %local.a02
  %t2138 = load i64, ptr %local.h.2067
  %t2139 = call i64 @"sx_f64_sub"(i64 %t2137, i64 %t2138)
  store i64 %t2139, ptr %local.m02.2081
  br label %then38_end
then38_end:
  br label %endif38
else38:
  br label %else38_end
else38_end:
  br label %endif38
endif38:
  %t2140 = phi i64 [ 0, %then38_end ], [ 0, %else38_end ]
  %t2141 = load i64, ptr %local.which
  %t2142 = icmp eq i64 %t2141, 2
  %t2143 = zext i1 %t2142 to i64
  %t2144 = icmp ne i64 %t2143, 0
  br i1 %t2144, label %then39, label %else39
then39:
  %t2145 = load i64, ptr %local.a03
  %t2146 = load i64, ptr %local.h.2067
  %t2147 = call i64 @"sx_f64_add"(i64 %t2145, i64 %t2146)
  store i64 %t2147, ptr %local.p03.2070
  %t2148 = load i64, ptr %local.a03
  %t2149 = load i64, ptr %local.h.2067
  %t2150 = call i64 @"sx_f64_sub"(i64 %t2148, i64 %t2149)
  store i64 %t2150, ptr %local.m03.2082
  br label %then39_end
then39_end:
  br label %endif39
else39:
  br label %else39_end
else39_end:
  br label %endif39
endif39:
  %t2151 = phi i64 [ 0, %then39_end ], [ 0, %else39_end ]
  %t2152 = load i64, ptr %local.which
  %t2153 = icmp eq i64 %t2152, 3
  %t2154 = zext i1 %t2153 to i64
  %t2155 = icmp ne i64 %t2154, 0
  br i1 %t2155, label %then40, label %else40
then40:
  %t2156 = load i64, ptr %local.a10
  %t2157 = load i64, ptr %local.h.2067
  %t2158 = call i64 @"sx_f64_add"(i64 %t2156, i64 %t2157)
  store i64 %t2158, ptr %local.p10.2071
  %t2159 = load i64, ptr %local.a10
  %t2160 = load i64, ptr %local.h.2067
  %t2161 = call i64 @"sx_f64_sub"(i64 %t2159, i64 %t2160)
  store i64 %t2161, ptr %local.m10.2083
  br label %then40_end
then40_end:
  br label %endif40
else40:
  br label %else40_end
else40_end:
  br label %endif40
endif40:
  %t2162 = phi i64 [ 0, %then40_end ], [ 0, %else40_end ]
  %t2163 = load i64, ptr %local.which
  %t2164 = icmp eq i64 %t2163, 4
  %t2165 = zext i1 %t2164 to i64
  %t2166 = icmp ne i64 %t2165, 0
  br i1 %t2166, label %then41, label %else41
then41:
  %t2167 = load i64, ptr %local.a12
  %t2168 = load i64, ptr %local.h.2067
  %t2169 = call i64 @"sx_f64_add"(i64 %t2167, i64 %t2168)
  store i64 %t2169, ptr %local.p12.2072
  %t2170 = load i64, ptr %local.a12
  %t2171 = load i64, ptr %local.h.2067
  %t2172 = call i64 @"sx_f64_sub"(i64 %t2170, i64 %t2171)
  store i64 %t2172, ptr %local.m12.2084
  br label %then41_end
then41_end:
  br label %endif41
else41:
  br label %else41_end
else41_end:
  br label %endif41
endif41:
  %t2173 = phi i64 [ 0, %then41_end ], [ 0, %else41_end ]
  %t2174 = load i64, ptr %local.which
  %t2175 = icmp eq i64 %t2174, 5
  %t2176 = zext i1 %t2175 to i64
  %t2177 = icmp ne i64 %t2176, 0
  br i1 %t2177, label %then42, label %else42
then42:
  %t2178 = load i64, ptr %local.a13
  %t2179 = load i64, ptr %local.h.2067
  %t2180 = call i64 @"sx_f64_add"(i64 %t2178, i64 %t2179)
  store i64 %t2180, ptr %local.p13.2073
  %t2181 = load i64, ptr %local.a13
  %t2182 = load i64, ptr %local.h.2067
  %t2183 = call i64 @"sx_f64_sub"(i64 %t2181, i64 %t2182)
  store i64 %t2183, ptr %local.m13.2085
  br label %then42_end
then42_end:
  br label %endif42
else42:
  br label %else42_end
else42_end:
  br label %endif42
endif42:
  %t2184 = phi i64 [ 0, %then42_end ], [ 0, %else42_end ]
  %t2185 = load i64, ptr %local.which
  %t2186 = icmp eq i64 %t2185, 6
  %t2187 = zext i1 %t2186 to i64
  %t2188 = icmp ne i64 %t2187, 0
  br i1 %t2188, label %then43, label %else43
then43:
  %t2189 = load i64, ptr %local.a20
  %t2190 = load i64, ptr %local.h.2067
  %t2191 = call i64 @"sx_f64_add"(i64 %t2189, i64 %t2190)
  store i64 %t2191, ptr %local.p20.2074
  %t2192 = load i64, ptr %local.a20
  %t2193 = load i64, ptr %local.h.2067
  %t2194 = call i64 @"sx_f64_sub"(i64 %t2192, i64 %t2193)
  store i64 %t2194, ptr %local.m20.2086
  br label %then43_end
then43_end:
  br label %endif43
else43:
  br label %else43_end
else43_end:
  br label %endif43
endif43:
  %t2195 = phi i64 [ 0, %then43_end ], [ 0, %else43_end ]
  %t2196 = load i64, ptr %local.which
  %t2197 = icmp eq i64 %t2196, 7
  %t2198 = zext i1 %t2197 to i64
  %t2199 = icmp ne i64 %t2198, 0
  br i1 %t2199, label %then44, label %else44
then44:
  %t2200 = load i64, ptr %local.a21
  %t2201 = load i64, ptr %local.h.2067
  %t2202 = call i64 @"sx_f64_add"(i64 %t2200, i64 %t2201)
  store i64 %t2202, ptr %local.p21.2075
  %t2203 = load i64, ptr %local.a21
  %t2204 = load i64, ptr %local.h.2067
  %t2205 = call i64 @"sx_f64_sub"(i64 %t2203, i64 %t2204)
  store i64 %t2205, ptr %local.m21.2087
  br label %then44_end
then44_end:
  br label %endif44
else44:
  br label %else44_end
else44_end:
  br label %endif44
endif44:
  %t2206 = phi i64 [ 0, %then44_end ], [ 0, %else44_end ]
  %t2207 = load i64, ptr %local.which
  %t2208 = icmp eq i64 %t2207, 8
  %t2209 = zext i1 %t2208 to i64
  %t2210 = icmp ne i64 %t2209, 0
  br i1 %t2210, label %then45, label %else45
then45:
  %t2211 = load i64, ptr %local.a23
  %t2212 = load i64, ptr %local.h.2067
  %t2213 = call i64 @"sx_f64_add"(i64 %t2211, i64 %t2212)
  store i64 %t2213, ptr %local.p23.2076
  %t2214 = load i64, ptr %local.a23
  %t2215 = load i64, ptr %local.h.2067
  %t2216 = call i64 @"sx_f64_sub"(i64 %t2214, i64 %t2215)
  store i64 %t2216, ptr %local.m23.2088
  br label %then45_end
then45_end:
  br label %endif45
else45:
  br label %else45_end
else45_end:
  br label %endif45
endif45:
  %t2217 = phi i64 [ 0, %then45_end ], [ 0, %else45_end ]
  %t2218 = load i64, ptr %local.which
  %t2219 = icmp eq i64 %t2218, 9
  %t2220 = zext i1 %t2219 to i64
  %t2221 = icmp ne i64 %t2220, 0
  br i1 %t2221, label %then46, label %else46
then46:
  %t2222 = load i64, ptr %local.a30
  %t2223 = load i64, ptr %local.h.2067
  %t2224 = call i64 @"sx_f64_add"(i64 %t2222, i64 %t2223)
  store i64 %t2224, ptr %local.p30.2077
  %t2225 = load i64, ptr %local.a30
  %t2226 = load i64, ptr %local.h.2067
  %t2227 = call i64 @"sx_f64_sub"(i64 %t2225, i64 %t2226)
  store i64 %t2227, ptr %local.m30.2089
  br label %then46_end
then46_end:
  br label %endif46
else46:
  br label %else46_end
else46_end:
  br label %endif46
endif46:
  %t2228 = phi i64 [ 0, %then46_end ], [ 0, %else46_end ]
  %t2229 = load i64, ptr %local.which
  %t2230 = icmp eq i64 %t2229, 10
  %t2231 = zext i1 %t2230 to i64
  %t2232 = icmp ne i64 %t2231, 0
  br i1 %t2232, label %then47, label %else47
then47:
  %t2233 = load i64, ptr %local.a31
  %t2234 = load i64, ptr %local.h.2067
  %t2235 = call i64 @"sx_f64_add"(i64 %t2233, i64 %t2234)
  store i64 %t2235, ptr %local.p31.2078
  %t2236 = load i64, ptr %local.a31
  %t2237 = load i64, ptr %local.h.2067
  %t2238 = call i64 @"sx_f64_sub"(i64 %t2236, i64 %t2237)
  store i64 %t2238, ptr %local.m31.2090
  br label %then47_end
then47_end:
  br label %endif47
else47:
  br label %else47_end
else47_end:
  br label %endif47
endif47:
  %t2239 = phi i64 [ 0, %then47_end ], [ 0, %else47_end ]
  %t2240 = load i64, ptr %local.which
  %t2241 = icmp eq i64 %t2240, 11
  %t2242 = zext i1 %t2241 to i64
  %t2243 = icmp ne i64 %t2242, 0
  br i1 %t2243, label %then48, label %else48
then48:
  %t2244 = load i64, ptr %local.a32
  %t2245 = load i64, ptr %local.h.2067
  %t2246 = call i64 @"sx_f64_add"(i64 %t2244, i64 %t2245)
  store i64 %t2246, ptr %local.p32.2079
  %t2247 = load i64, ptr %local.a32
  %t2248 = load i64, ptr %local.h.2067
  %t2249 = call i64 @"sx_f64_sub"(i64 %t2247, i64 %t2248)
  store i64 %t2249, ptr %local.m32.2091
  br label %then48_end
then48_end:
  br label %endif48
else48:
  br label %else48_end
else48_end:
  br label %endif48
endif48:
  %t2250 = phi i64 [ 0, %then48_end ], [ 0, %else48_end ]
  %t2251 = load i64, ptr %local.p01.2068
  %t2252 = load i64, ptr %local.p02.2069
  %t2253 = load i64, ptr %local.p03.2070
  %t2254 = load i64, ptr %local.p10.2071
  %t2255 = load i64, ptr %local.p12.2072
  %t2256 = load i64, ptr %local.p13.2073
  %t2257 = load i64, ptr %local.p20.2074
  %t2258 = load i64, ptr %local.p21.2075
  %t2259 = load i64, ptr %local.p23.2076
  %t2260 = load i64, ptr %local.p30.2077
  %t2261 = load i64, ptr %local.p31.2078
  %t2262 = load i64, ptr %local.p32.2079
  %t2263 = load i64, ptr %local.steps
  %t2264 = call i64 @"run_inner"(i64 %t2251, i64 %t2252, i64 %t2253, i64 %t2254, i64 %t2255, i64 %t2256, i64 %t2257, i64 %t2258, i64 %t2259, i64 %t2260, i64 %t2261, i64 %t2262, i64 %t2263)
  store i64 %t2264, ptr %local.lp.2092
  %t2265 = load i64, ptr %local.m01.2080
  %t2266 = load i64, ptr %local.m02.2081
  %t2267 = load i64, ptr %local.m03.2082
  %t2268 = load i64, ptr %local.m10.2083
  %t2269 = load i64, ptr %local.m12.2084
  %t2270 = load i64, ptr %local.m13.2085
  %t2271 = load i64, ptr %local.m20.2086
  %t2272 = load i64, ptr %local.m21.2087
  %t2273 = load i64, ptr %local.m23.2088
  %t2274 = load i64, ptr %local.m30.2089
  %t2275 = load i64, ptr %local.m31.2090
  %t2276 = load i64, ptr %local.m32.2091
  %t2277 = load i64, ptr %local.steps
  %t2278 = call i64 @"run_inner"(i64 %t2265, i64 %t2266, i64 %t2267, i64 %t2268, i64 %t2269, i64 %t2270, i64 %t2271, i64 %t2272, i64 %t2273, i64 %t2274, i64 %t2275, i64 %t2276, i64 %t2277)
  store i64 %t2278, ptr %local.lm.2093
  %t2279 = load i64, ptr %local.lp.2092
  %t2280 = load i64, ptr %local.lm.2093
  %t2281 = call i64 @"sx_f64_sub"(i64 %t2279, i64 %t2280)
  %t2282 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.120)
  %t2283 = load i64, ptr %local.h.2067
  %t2284 = call i64 @"sx_f64_mul"(i64 %t2282, i64 %t2283)
  %t2285 = call i64 @"sx_f64_div"(i64 %t2281, i64 %t2284)
  ret i64 %t2285
}

define i64 @"print_row"(i64 %label, i64 %v0, i64 %v1, i64 %v2) nounwind {
entry:
  %local.label = alloca i64
  store i64 %label, ptr %local.label
  %local.v0 = alloca i64
  store i64 %v0, ptr %local.v0
  %local.v1 = alloca i64
  store i64 %v1, ptr %local.v1
  %local.v2 = alloca i64
  store i64 %v2, ptr %local.v2
  %t2286 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.121)
  %t2287 = ptrtoint ptr %t2286 to i64
  %t2288 = inttoptr i64 %t2287 to ptr
  call void @intrinsic_print(ptr %t2288)
  %t2289 = load i64, ptr %local.label
  %t2290 = icmp eq i64 %t2289, 0
  %t2291 = zext i1 %t2290 to i64
  %t2292 = icmp ne i64 %t2291, 0
  br i1 %t2292, label %then49, label %else49
then49:
  %t2293 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.122)
  %t2294 = ptrtoint ptr %t2293 to i64
  %t2295 = inttoptr i64 %t2294 to ptr
  call void @intrinsic_print(ptr %t2295)
  br label %then49_end
then49_end:
  br label %endif49
else49:
  br label %else49_end
else49_end:
  br label %endif49
endif49:
  %t2296 = phi i64 [ 0, %then49_end ], [ 0, %else49_end ]
  %t2297 = load i64, ptr %local.label
  %t2298 = icmp eq i64 %t2297, 1
  %t2299 = zext i1 %t2298 to i64
  %t2300 = icmp ne i64 %t2299, 0
  br i1 %t2300, label %then50, label %else50
then50:
  %t2301 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.123)
  %t2302 = ptrtoint ptr %t2301 to i64
  %t2303 = inttoptr i64 %t2302 to ptr
  call void @intrinsic_print(ptr %t2303)
  br label %then50_end
then50_end:
  br label %endif50
else50:
  br label %else50_end
else50_end:
  br label %endif50
endif50:
  %t2304 = phi i64 [ 0, %then50_end ], [ 0, %else50_end ]
  %t2305 = load i64, ptr %local.label
  %t2306 = icmp eq i64 %t2305, 2
  %t2307 = zext i1 %t2306 to i64
  %t2308 = icmp ne i64 %t2307, 0
  br i1 %t2308, label %then51, label %else51
then51:
  %t2309 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.124)
  %t2310 = ptrtoint ptr %t2309 to i64
  %t2311 = inttoptr i64 %t2310 to ptr
  call void @intrinsic_print(ptr %t2311)
  br label %then51_end
then51_end:
  br label %endif51
else51:
  br label %else51_end
else51_end:
  br label %endif51
endif51:
  %t2312 = phi i64 [ 0, %then51_end ], [ 0, %else51_end ]
  %t2313 = load i64, ptr %local.label
  %t2314 = icmp eq i64 %t2313, 3
  %t2315 = zext i1 %t2314 to i64
  %t2316 = icmp ne i64 %t2315, 0
  br i1 %t2316, label %then52, label %else52
then52:
  %t2317 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.125)
  %t2318 = ptrtoint ptr %t2317 to i64
  %t2319 = inttoptr i64 %t2318 to ptr
  call void @intrinsic_print(ptr %t2319)
  br label %then52_end
then52_end:
  br label %endif52
else52:
  br label %else52_end
else52_end:
  br label %endif52
endif52:
  %t2320 = phi i64 [ 0, %then52_end ], [ 0, %else52_end ]
  %t2321 = load i64, ptr %local.v0
  %t2322 = call i64 @"print_f64"(i64 %t2321)
  %t2323 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.126)
  %t2324 = ptrtoint ptr %t2323 to i64
  %t2325 = inttoptr i64 %t2324 to ptr
  call void @intrinsic_print(ptr %t2325)
  %t2326 = load i64, ptr %local.v1
  %t2327 = call i64 @"print_f64"(i64 %t2326)
  %t2328 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.127)
  %t2329 = ptrtoint ptr %t2328 to i64
  %t2330 = inttoptr i64 %t2329 to ptr
  call void @intrinsic_print(ptr %t2330)
  %t2331 = load i64, ptr %local.v2
  %t2332 = call i64 @"print_f64"(i64 %t2331)
  %t2333 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.128)
  %t2334 = ptrtoint ptr %t2333 to i64
  %t2335 = inttoptr i64 %t2334 to ptr
  call void @intrinsic_println(ptr %t2335)
  ret i64 0
}

define i64 @"print_cycle_header"() nounwind {
entry:
  %t2336 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.129)
  %t2337 = ptrtoint ptr %t2336 to i64
  %t2338 = inttoptr i64 %t2337 to ptr
  call void @intrinsic_println(ptr %t2338)
  %t2339 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.130)
  %t2340 = ptrtoint ptr %t2339 to i64
  %t2341 = inttoptr i64 %t2340 to ptr
  call void @intrinsic_println(ptr %t2341)
  ret i64 0
}

define i64 @"print_cycle"(i64 %cyc, i64 %loss, i64 %lyap, i64 %drift, i64 %score) nounwind {
entry:
  %local.cyc = alloca i64
  store i64 %cyc, ptr %local.cyc
  %local.loss = alloca i64
  store i64 %loss, ptr %local.loss
  %local.lyap = alloca i64
  store i64 %lyap, ptr %local.lyap
  %local.drift = alloca i64
  store i64 %drift, ptr %local.drift
  %local.score = alloca i64
  store i64 %score, ptr %local.score
  %t2342 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.131)
  %t2343 = ptrtoint ptr %t2342 to i64
  %t2344 = inttoptr i64 %t2343 to ptr
  call void @intrinsic_print(ptr %t2344)
  %t2345 = load i64, ptr %local.cyc
  call void @print_i64(i64 %t2345)
  %t2346 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.132)
  %t2347 = ptrtoint ptr %t2346 to i64
  %t2348 = inttoptr i64 %t2347 to ptr
  call void @intrinsic_print(ptr %t2348)
  %t2349 = load i64, ptr %local.loss
  %t2350 = call i64 @"print_f64"(i64 %t2349)
  %t2351 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.133)
  %t2352 = ptrtoint ptr %t2351 to i64
  %t2353 = inttoptr i64 %t2352 to ptr
  call void @intrinsic_print(ptr %t2353)
  %t2354 = load i64, ptr %local.lyap
  %t2355 = call i64 @"print_f64"(i64 %t2354)
  %t2356 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.134)
  %t2357 = ptrtoint ptr %t2356 to i64
  %t2358 = inttoptr i64 %t2357 to ptr
  call void @intrinsic_print(ptr %t2358)
  %t2359 = load i64, ptr %local.drift
  %t2360 = call i64 @"print_f64"(i64 %t2359)
  %t2361 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.135)
  %t2362 = ptrtoint ptr %t2361 to i64
  %t2363 = inttoptr i64 %t2362 to ptr
  call void @intrinsic_print(ptr %t2363)
  %t2364 = load i64, ptr %local.score
  %t2365 = call i64 @"print_f64"(i64 %t2364)
  %t2366 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.136)
  %t2367 = ptrtoint ptr %t2366 to i64
  %t2368 = inttoptr i64 %t2367 to ptr
  call void @intrinsic_println(ptr %t2368)
  ret i64 0
}

define i64 @"simplex_main"() nounwind {
entry:
  %local.inner_steps.2369 = alloca i64
  %local.meta_cycles.2370 = alloca i64
  %local.meta_lr.2371 = alloca i64
  %local.loss_base.2372 = alloca i64
  %local.lyap_base.2373 = alloca i64
  %local.loss_unif.2374 = alloca i64
  %local.lyap_unif.2375 = alloca i64
  %local.a01.2376 = alloca i64
  %local.a02.2377 = alloca i64
  %local.a03.2378 = alloca i64
  %local.a10.2379 = alloca i64
  %local.a12.2380 = alloca i64
  %local.a13.2381 = alloca i64
  %local.a20.2382 = alloca i64
  %local.a21.2383 = alloca i64
  %local.a23.2384 = alloca i64
  %local.a30.2385 = alloca i64
  %local.a31.2386 = alloca i64
  %local.a32.2387 = alloca i64
  %local.prev_drift.2388 = alloca i64
  %local.prev_prev_drift.2389 = alloca i64
  %local.drift.2390 = alloca i64
  %local.d_prime.2391 = alloca i64
  %local.d_double.2392 = alloca i64
  %local.score.2393 = alloca i64
  %local.cycle.2394 = alloca i64
  %local.loss.2395 = alloca i64
  %local.lyap.2396 = alloca i64
  %local.mg.2397 = alloca i64
  %local.pa01.2398 = alloca i64
  %local.pa02.2399 = alloca i64
  %local.pa03.2400 = alloca i64
  %local.pa10.2401 = alloca i64
  %local.pa12.2402 = alloca i64
  %local.pa13.2403 = alloca i64
  %local.pa20.2404 = alloca i64
  %local.pa21.2405 = alloca i64
  %local.pa23.2406 = alloca i64
  %local.pa30.2407 = alloca i64
  %local.pa31.2408 = alloca i64
  %local.pa32.2409 = alloca i64
  %local.r.2410 = alloca i64
  %local.final_loss.2411 = alloca i64
  %local.final_lyap.2412 = alloca i64
  store i64 200, ptr %local.inner_steps.2369
  store i64 80, ptr %local.meta_cycles.2370
  %t2413 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.137)
  store i64 %t2413, ptr %local.meta_lr.2371
  %t2414 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.138)
  %t2415 = ptrtoint ptr %t2414 to i64
  %t2416 = inttoptr i64 %t2415 to ptr
  call void @intrinsic_println(ptr %t2416)
  %t2417 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.139)
  %t2418 = ptrtoint ptr %t2417 to i64
  %t2419 = inttoptr i64 %t2418 to ptr
  call void @intrinsic_println(ptr %t2419)
  %t2420 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.140)
  %t2421 = ptrtoint ptr %t2420 to i64
  %t2422 = inttoptr i64 %t2421 to ptr
  call void @intrinsic_println(ptr %t2422)
  %t2423 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.141)
  %t2424 = ptrtoint ptr %t2423 to i64
  %t2425 = inttoptr i64 %t2424 to ptr
  call void @intrinsic_println(ptr %t2425)
  %t2426 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.142)
  %t2427 = ptrtoint ptr %t2426 to i64
  %t2428 = inttoptr i64 %t2427 to ptr
  call void @intrinsic_println(ptr %t2428)
  %t2429 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.143)
  %t2430 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.144)
  %t2431 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.145)
  %t2432 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.146)
  %t2433 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.147)
  %t2434 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.148)
  %t2435 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.149)
  %t2436 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.150)
  %t2437 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.151)
  %t2438 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.152)
  %t2439 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.153)
  %t2440 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.154)
  %t2441 = load i64, ptr %local.inner_steps.2369
  %t2442 = call i64 @"run_inner"(i64 %t2429, i64 %t2430, i64 %t2431, i64 %t2432, i64 %t2433, i64 %t2434, i64 %t2435, i64 %t2436, i64 %t2437, i64 %t2438, i64 %t2439, i64 %t2440, i64 %t2441)
  store i64 %t2442, ptr %local.loss_base.2372
  %t2443 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.155)
  %t2444 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.156)
  %t2445 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.157)
  %t2446 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.158)
  %t2447 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.159)
  %t2448 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.160)
  %t2449 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.161)
  %t2450 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.162)
  %t2451 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.163)
  %t2452 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.164)
  %t2453 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.165)
  %t2454 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.166)
  %t2455 = load i64, ptr %local.inner_steps.2369
  %t2456 = call i64 @"run_inner_lyapunov"(i64 %t2443, i64 %t2444, i64 %t2445, i64 %t2446, i64 %t2447, i64 %t2448, i64 %t2449, i64 %t2450, i64 %t2451, i64 %t2452, i64 %t2453, i64 %t2454, i64 %t2455)
  store i64 %t2456, ptr %local.lyap_base.2373
  %t2457 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.167)
  %t2458 = ptrtoint ptr %t2457 to i64
  %t2459 = inttoptr i64 %t2458 to ptr
  call void @intrinsic_print(ptr %t2459)
  %t2460 = load i64, ptr %local.loss_base.2372
  %t2461 = call i64 @"print_f64"(i64 %t2460)
  %t2462 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.168)
  %t2463 = ptrtoint ptr %t2462 to i64
  %t2464 = inttoptr i64 %t2463 to ptr
  call void @intrinsic_print(ptr %t2464)
  %t2465 = load i64, ptr %local.lyap_base.2373
  %t2466 = call i64 @"print_f64"(i64 %t2465)
  %t2467 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.169)
  %t2468 = ptrtoint ptr %t2467 to i64
  %t2469 = inttoptr i64 %t2468 to ptr
  call void @intrinsic_println(ptr %t2469)
  %t2470 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.170)
  %t2471 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.171)
  %t2472 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.172)
  %t2473 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.173)
  %t2474 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.174)
  %t2475 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.175)
  %t2476 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.176)
  %t2477 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.177)
  %t2478 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.178)
  %t2479 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.179)
  %t2480 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.180)
  %t2481 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.181)
  %t2482 = load i64, ptr %local.inner_steps.2369
  %t2483 = call i64 @"run_inner"(i64 %t2470, i64 %t2471, i64 %t2472, i64 %t2473, i64 %t2474, i64 %t2475, i64 %t2476, i64 %t2477, i64 %t2478, i64 %t2479, i64 %t2480, i64 %t2481, i64 %t2482)
  store i64 %t2483, ptr %local.loss_unif.2374
  %t2484 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.182)
  %t2485 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.183)
  %t2486 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.184)
  %t2487 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.185)
  %t2488 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.186)
  %t2489 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.187)
  %t2490 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.188)
  %t2491 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.189)
  %t2492 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.190)
  %t2493 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.191)
  %t2494 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.192)
  %t2495 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.193)
  %t2496 = load i64, ptr %local.inner_steps.2369
  %t2497 = call i64 @"run_inner_lyapunov"(i64 %t2484, i64 %t2485, i64 %t2486, i64 %t2487, i64 %t2488, i64 %t2489, i64 %t2490, i64 %t2491, i64 %t2492, i64 %t2493, i64 %t2494, i64 %t2495, i64 %t2496)
  store i64 %t2497, ptr %local.lyap_unif.2375
  %t2498 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.194)
  %t2499 = ptrtoint ptr %t2498 to i64
  %t2500 = inttoptr i64 %t2499 to ptr
  call void @intrinsic_print(ptr %t2500)
  %t2501 = load i64, ptr %local.loss_unif.2374
  %t2502 = call i64 @"print_f64"(i64 %t2501)
  %t2503 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.195)
  %t2504 = ptrtoint ptr %t2503 to i64
  %t2505 = inttoptr i64 %t2504 to ptr
  call void @intrinsic_print(ptr %t2505)
  %t2506 = load i64, ptr %local.lyap_unif.2375
  %t2507 = call i64 @"print_f64"(i64 %t2506)
  %t2508 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.196)
  %t2509 = ptrtoint ptr %t2508 to i64
  %t2510 = inttoptr i64 %t2509 to ptr
  call void @intrinsic_println(ptr %t2510)
  %t2511 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.197)
  %t2512 = ptrtoint ptr %t2511 to i64
  %t2513 = inttoptr i64 %t2512 to ptr
  call void @intrinsic_println(ptr %t2513)
  %t2514 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.198)
  %t2515 = ptrtoint ptr %t2514 to i64
  %t2516 = inttoptr i64 %t2515 to ptr
  call void @intrinsic_println(ptr %t2516)
  %t2517 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.199)
  %t2518 = ptrtoint ptr %t2517 to i64
  %t2519 = inttoptr i64 %t2518 to ptr
  call void @intrinsic_println(ptr %t2519)
  %t2520 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.200)
  store i64 %t2520, ptr %local.a01.2376
  %t2521 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.201)
  store i64 %t2521, ptr %local.a02.2377
  %t2522 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.202)
  store i64 %t2522, ptr %local.a03.2378
  %t2523 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.203)
  store i64 %t2523, ptr %local.a10.2379
  %t2524 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.204)
  store i64 %t2524, ptr %local.a12.2380
  %t2525 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.205)
  store i64 %t2525, ptr %local.a13.2381
  %t2526 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.206)
  store i64 %t2526, ptr %local.a20.2382
  %t2527 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.207)
  store i64 %t2527, ptr %local.a21.2383
  %t2528 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.208)
  store i64 %t2528, ptr %local.a23.2384
  %t2529 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.209)
  store i64 %t2529, ptr %local.a30.2385
  %t2530 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.210)
  store i64 %t2530, ptr %local.a31.2386
  %t2531 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.211)
  store i64 %t2531, ptr %local.a32.2387
  %t2532 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.212)
  store i64 %t2532, ptr %local.prev_drift.2388
  %t2533 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.213)
  store i64 %t2533, ptr %local.prev_prev_drift.2389
  %t2534 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.214)
  store i64 %t2534, ptr %local.drift.2390
  %t2535 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.215)
  store i64 %t2535, ptr %local.d_prime.2391
  %t2536 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.216)
  store i64 %t2536, ptr %local.d_double.2392
  %t2537 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.217)
  store i64 %t2537, ptr %local.score.2393
  store i64 0, ptr %local.cycle.2394
  %t2538 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.218)
  store i64 %t2538, ptr %local.loss.2395
  %t2539 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.219)
  store i64 %t2539, ptr %local.lyap.2396
  %t2540 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.220)
  store i64 %t2540, ptr %local.mg.2397
  %t2541 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.221)
  store i64 %t2541, ptr %local.pa01.2398
  %t2542 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.222)
  store i64 %t2542, ptr %local.pa02.2399
  %t2543 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.223)
  store i64 %t2543, ptr %local.pa03.2400
  %t2544 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.224)
  store i64 %t2544, ptr %local.pa10.2401
  %t2545 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.225)
  store i64 %t2545, ptr %local.pa12.2402
  %t2546 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.226)
  store i64 %t2546, ptr %local.pa13.2403
  %t2547 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.227)
  store i64 %t2547, ptr %local.pa20.2404
  %t2548 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.228)
  store i64 %t2548, ptr %local.pa21.2405
  %t2549 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.229)
  store i64 %t2549, ptr %local.pa23.2406
  %t2550 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.230)
  store i64 %t2550, ptr %local.pa30.2407
  %t2551 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.231)
  store i64 %t2551, ptr %local.pa31.2408
  %t2552 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.232)
  store i64 %t2552, ptr %local.pa32.2409
  store i64 0, ptr %local.r.2410
  %t2553 = call i64 @"print_cycle_header"()
  store i64 %t2553, ptr %local.r.2410
  br label %loop53
loop53:
  %t2554 = load i64, ptr %local.cycle.2394
  %t2555 = load i64, ptr %local.meta_cycles.2370
  %t2556 = icmp slt i64 %t2554, %t2555
  %t2557 = zext i1 %t2556 to i64
  %t2558 = icmp ne i64 %t2557, 0
  br i1 %t2558, label %body53, label %endloop53
body53:
  %t2559 = load i64, ptr %local.a01.2376
  store i64 %t2559, ptr %local.pa01.2398
  %t2560 = load i64, ptr %local.a02.2377
  store i64 %t2560, ptr %local.pa02.2399
  %t2561 = load i64, ptr %local.a03.2378
  store i64 %t2561, ptr %local.pa03.2400
  %t2562 = load i64, ptr %local.a10.2379
  store i64 %t2562, ptr %local.pa10.2401
  %t2563 = load i64, ptr %local.a12.2380
  store i64 %t2563, ptr %local.pa12.2402
  %t2564 = load i64, ptr %local.a13.2381
  store i64 %t2564, ptr %local.pa13.2403
  %t2565 = load i64, ptr %local.a20.2382
  store i64 %t2565, ptr %local.pa20.2404
  %t2566 = load i64, ptr %local.a21.2383
  store i64 %t2566, ptr %local.pa21.2405
  %t2567 = load i64, ptr %local.a23.2384
  store i64 %t2567, ptr %local.pa23.2406
  %t2568 = load i64, ptr %local.a30.2385
  store i64 %t2568, ptr %local.pa30.2407
  %t2569 = load i64, ptr %local.a31.2386
  store i64 %t2569, ptr %local.pa31.2408
  %t2570 = load i64, ptr %local.a32.2387
  store i64 %t2570, ptr %local.pa32.2409
  %t2571 = load i64, ptr %local.a01.2376
  %t2572 = load i64, ptr %local.a02.2377
  %t2573 = load i64, ptr %local.a03.2378
  %t2574 = load i64, ptr %local.a10.2379
  %t2575 = load i64, ptr %local.a12.2380
  %t2576 = load i64, ptr %local.a13.2381
  %t2577 = load i64, ptr %local.a20.2382
  %t2578 = load i64, ptr %local.a21.2383
  %t2579 = load i64, ptr %local.a23.2384
  %t2580 = load i64, ptr %local.a30.2385
  %t2581 = load i64, ptr %local.a31.2386
  %t2582 = load i64, ptr %local.a32.2387
  %t2583 = load i64, ptr %local.inner_steps.2369
  %t2584 = call i64 @"meta_grad"(i64 %t2571, i64 %t2572, i64 %t2573, i64 %t2574, i64 %t2575, i64 %t2576, i64 %t2577, i64 %t2578, i64 %t2579, i64 %t2580, i64 %t2581, i64 %t2582, i64 0, i64 %t2583)
  store i64 %t2584, ptr %local.mg.2397
  %t2585 = load i64, ptr %local.a01.2376
  %t2586 = load i64, ptr %local.meta_lr.2371
  %t2587 = load i64, ptr %local.mg.2397
  %t2588 = call i64 @"sx_f64_mul"(i64 %t2586, i64 %t2587)
  %t2589 = call i64 @"sx_f64_sub"(i64 %t2585, i64 %t2588)
  %t2590 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.233)
  %t2591 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.234)
  %t2592 = call i64 @"clamp"(i64 %t2589, i64 %t2590, i64 %t2591)
  store i64 %t2592, ptr %local.a01.2376
  %t2593 = load i64, ptr %local.a01.2376
  %t2594 = load i64, ptr %local.a02.2377
  %t2595 = load i64, ptr %local.a03.2378
  %t2596 = load i64, ptr %local.a10.2379
  %t2597 = load i64, ptr %local.a12.2380
  %t2598 = load i64, ptr %local.a13.2381
  %t2599 = load i64, ptr %local.a20.2382
  %t2600 = load i64, ptr %local.a21.2383
  %t2601 = load i64, ptr %local.a23.2384
  %t2602 = load i64, ptr %local.a30.2385
  %t2603 = load i64, ptr %local.a31.2386
  %t2604 = load i64, ptr %local.a32.2387
  %t2605 = load i64, ptr %local.inner_steps.2369
  %t2606 = call i64 @"meta_grad"(i64 %t2593, i64 %t2594, i64 %t2595, i64 %t2596, i64 %t2597, i64 %t2598, i64 %t2599, i64 %t2600, i64 %t2601, i64 %t2602, i64 %t2603, i64 %t2604, i64 1, i64 %t2605)
  store i64 %t2606, ptr %local.mg.2397
  %t2607 = load i64, ptr %local.a02.2377
  %t2608 = load i64, ptr %local.meta_lr.2371
  %t2609 = load i64, ptr %local.mg.2397
  %t2610 = call i64 @"sx_f64_mul"(i64 %t2608, i64 %t2609)
  %t2611 = call i64 @"sx_f64_sub"(i64 %t2607, i64 %t2610)
  %t2612 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.235)
  %t2613 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.236)
  %t2614 = call i64 @"clamp"(i64 %t2611, i64 %t2612, i64 %t2613)
  store i64 %t2614, ptr %local.a02.2377
  %t2615 = load i64, ptr %local.a01.2376
  %t2616 = load i64, ptr %local.a02.2377
  %t2617 = load i64, ptr %local.a03.2378
  %t2618 = load i64, ptr %local.a10.2379
  %t2619 = load i64, ptr %local.a12.2380
  %t2620 = load i64, ptr %local.a13.2381
  %t2621 = load i64, ptr %local.a20.2382
  %t2622 = load i64, ptr %local.a21.2383
  %t2623 = load i64, ptr %local.a23.2384
  %t2624 = load i64, ptr %local.a30.2385
  %t2625 = load i64, ptr %local.a31.2386
  %t2626 = load i64, ptr %local.a32.2387
  %t2627 = load i64, ptr %local.inner_steps.2369
  %t2628 = call i64 @"meta_grad"(i64 %t2615, i64 %t2616, i64 %t2617, i64 %t2618, i64 %t2619, i64 %t2620, i64 %t2621, i64 %t2622, i64 %t2623, i64 %t2624, i64 %t2625, i64 %t2626, i64 2, i64 %t2627)
  store i64 %t2628, ptr %local.mg.2397
  %t2629 = load i64, ptr %local.a03.2378
  %t2630 = load i64, ptr %local.meta_lr.2371
  %t2631 = load i64, ptr %local.mg.2397
  %t2632 = call i64 @"sx_f64_mul"(i64 %t2630, i64 %t2631)
  %t2633 = call i64 @"sx_f64_sub"(i64 %t2629, i64 %t2632)
  %t2634 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.237)
  %t2635 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.238)
  %t2636 = call i64 @"clamp"(i64 %t2633, i64 %t2634, i64 %t2635)
  store i64 %t2636, ptr %local.a03.2378
  %t2637 = load i64, ptr %local.a01.2376
  %t2638 = load i64, ptr %local.a02.2377
  %t2639 = load i64, ptr %local.a03.2378
  %t2640 = load i64, ptr %local.a10.2379
  %t2641 = load i64, ptr %local.a12.2380
  %t2642 = load i64, ptr %local.a13.2381
  %t2643 = load i64, ptr %local.a20.2382
  %t2644 = load i64, ptr %local.a21.2383
  %t2645 = load i64, ptr %local.a23.2384
  %t2646 = load i64, ptr %local.a30.2385
  %t2647 = load i64, ptr %local.a31.2386
  %t2648 = load i64, ptr %local.a32.2387
  %t2649 = load i64, ptr %local.inner_steps.2369
  %t2650 = call i64 @"meta_grad"(i64 %t2637, i64 %t2638, i64 %t2639, i64 %t2640, i64 %t2641, i64 %t2642, i64 %t2643, i64 %t2644, i64 %t2645, i64 %t2646, i64 %t2647, i64 %t2648, i64 3, i64 %t2649)
  store i64 %t2650, ptr %local.mg.2397
  %t2651 = load i64, ptr %local.a10.2379
  %t2652 = load i64, ptr %local.meta_lr.2371
  %t2653 = load i64, ptr %local.mg.2397
  %t2654 = call i64 @"sx_f64_mul"(i64 %t2652, i64 %t2653)
  %t2655 = call i64 @"sx_f64_sub"(i64 %t2651, i64 %t2654)
  %t2656 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.239)
  %t2657 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.240)
  %t2658 = call i64 @"clamp"(i64 %t2655, i64 %t2656, i64 %t2657)
  store i64 %t2658, ptr %local.a10.2379
  %t2659 = load i64, ptr %local.a01.2376
  %t2660 = load i64, ptr %local.a02.2377
  %t2661 = load i64, ptr %local.a03.2378
  %t2662 = load i64, ptr %local.a10.2379
  %t2663 = load i64, ptr %local.a12.2380
  %t2664 = load i64, ptr %local.a13.2381
  %t2665 = load i64, ptr %local.a20.2382
  %t2666 = load i64, ptr %local.a21.2383
  %t2667 = load i64, ptr %local.a23.2384
  %t2668 = load i64, ptr %local.a30.2385
  %t2669 = load i64, ptr %local.a31.2386
  %t2670 = load i64, ptr %local.a32.2387
  %t2671 = load i64, ptr %local.inner_steps.2369
  %t2672 = call i64 @"meta_grad"(i64 %t2659, i64 %t2660, i64 %t2661, i64 %t2662, i64 %t2663, i64 %t2664, i64 %t2665, i64 %t2666, i64 %t2667, i64 %t2668, i64 %t2669, i64 %t2670, i64 4, i64 %t2671)
  store i64 %t2672, ptr %local.mg.2397
  %t2673 = load i64, ptr %local.a12.2380
  %t2674 = load i64, ptr %local.meta_lr.2371
  %t2675 = load i64, ptr %local.mg.2397
  %t2676 = call i64 @"sx_f64_mul"(i64 %t2674, i64 %t2675)
  %t2677 = call i64 @"sx_f64_sub"(i64 %t2673, i64 %t2676)
  %t2678 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.241)
  %t2679 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.242)
  %t2680 = call i64 @"clamp"(i64 %t2677, i64 %t2678, i64 %t2679)
  store i64 %t2680, ptr %local.a12.2380
  %t2681 = load i64, ptr %local.a01.2376
  %t2682 = load i64, ptr %local.a02.2377
  %t2683 = load i64, ptr %local.a03.2378
  %t2684 = load i64, ptr %local.a10.2379
  %t2685 = load i64, ptr %local.a12.2380
  %t2686 = load i64, ptr %local.a13.2381
  %t2687 = load i64, ptr %local.a20.2382
  %t2688 = load i64, ptr %local.a21.2383
  %t2689 = load i64, ptr %local.a23.2384
  %t2690 = load i64, ptr %local.a30.2385
  %t2691 = load i64, ptr %local.a31.2386
  %t2692 = load i64, ptr %local.a32.2387
  %t2693 = load i64, ptr %local.inner_steps.2369
  %t2694 = call i64 @"meta_grad"(i64 %t2681, i64 %t2682, i64 %t2683, i64 %t2684, i64 %t2685, i64 %t2686, i64 %t2687, i64 %t2688, i64 %t2689, i64 %t2690, i64 %t2691, i64 %t2692, i64 5, i64 %t2693)
  store i64 %t2694, ptr %local.mg.2397
  %t2695 = load i64, ptr %local.a13.2381
  %t2696 = load i64, ptr %local.meta_lr.2371
  %t2697 = load i64, ptr %local.mg.2397
  %t2698 = call i64 @"sx_f64_mul"(i64 %t2696, i64 %t2697)
  %t2699 = call i64 @"sx_f64_sub"(i64 %t2695, i64 %t2698)
  %t2700 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.243)
  %t2701 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.244)
  %t2702 = call i64 @"clamp"(i64 %t2699, i64 %t2700, i64 %t2701)
  store i64 %t2702, ptr %local.a13.2381
  %t2703 = load i64, ptr %local.a01.2376
  %t2704 = load i64, ptr %local.a02.2377
  %t2705 = load i64, ptr %local.a03.2378
  %t2706 = load i64, ptr %local.a10.2379
  %t2707 = load i64, ptr %local.a12.2380
  %t2708 = load i64, ptr %local.a13.2381
  %t2709 = load i64, ptr %local.a20.2382
  %t2710 = load i64, ptr %local.a21.2383
  %t2711 = load i64, ptr %local.a23.2384
  %t2712 = load i64, ptr %local.a30.2385
  %t2713 = load i64, ptr %local.a31.2386
  %t2714 = load i64, ptr %local.a32.2387
  %t2715 = load i64, ptr %local.inner_steps.2369
  %t2716 = call i64 @"meta_grad"(i64 %t2703, i64 %t2704, i64 %t2705, i64 %t2706, i64 %t2707, i64 %t2708, i64 %t2709, i64 %t2710, i64 %t2711, i64 %t2712, i64 %t2713, i64 %t2714, i64 6, i64 %t2715)
  store i64 %t2716, ptr %local.mg.2397
  %t2717 = load i64, ptr %local.a20.2382
  %t2718 = load i64, ptr %local.meta_lr.2371
  %t2719 = load i64, ptr %local.mg.2397
  %t2720 = call i64 @"sx_f64_mul"(i64 %t2718, i64 %t2719)
  %t2721 = call i64 @"sx_f64_sub"(i64 %t2717, i64 %t2720)
  %t2722 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.245)
  %t2723 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.246)
  %t2724 = call i64 @"clamp"(i64 %t2721, i64 %t2722, i64 %t2723)
  store i64 %t2724, ptr %local.a20.2382
  %t2725 = load i64, ptr %local.a01.2376
  %t2726 = load i64, ptr %local.a02.2377
  %t2727 = load i64, ptr %local.a03.2378
  %t2728 = load i64, ptr %local.a10.2379
  %t2729 = load i64, ptr %local.a12.2380
  %t2730 = load i64, ptr %local.a13.2381
  %t2731 = load i64, ptr %local.a20.2382
  %t2732 = load i64, ptr %local.a21.2383
  %t2733 = load i64, ptr %local.a23.2384
  %t2734 = load i64, ptr %local.a30.2385
  %t2735 = load i64, ptr %local.a31.2386
  %t2736 = load i64, ptr %local.a32.2387
  %t2737 = load i64, ptr %local.inner_steps.2369
  %t2738 = call i64 @"meta_grad"(i64 %t2725, i64 %t2726, i64 %t2727, i64 %t2728, i64 %t2729, i64 %t2730, i64 %t2731, i64 %t2732, i64 %t2733, i64 %t2734, i64 %t2735, i64 %t2736, i64 7, i64 %t2737)
  store i64 %t2738, ptr %local.mg.2397
  %t2739 = load i64, ptr %local.a21.2383
  %t2740 = load i64, ptr %local.meta_lr.2371
  %t2741 = load i64, ptr %local.mg.2397
  %t2742 = call i64 @"sx_f64_mul"(i64 %t2740, i64 %t2741)
  %t2743 = call i64 @"sx_f64_sub"(i64 %t2739, i64 %t2742)
  %t2744 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.247)
  %t2745 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.248)
  %t2746 = call i64 @"clamp"(i64 %t2743, i64 %t2744, i64 %t2745)
  store i64 %t2746, ptr %local.a21.2383
  %t2747 = load i64, ptr %local.a01.2376
  %t2748 = load i64, ptr %local.a02.2377
  %t2749 = load i64, ptr %local.a03.2378
  %t2750 = load i64, ptr %local.a10.2379
  %t2751 = load i64, ptr %local.a12.2380
  %t2752 = load i64, ptr %local.a13.2381
  %t2753 = load i64, ptr %local.a20.2382
  %t2754 = load i64, ptr %local.a21.2383
  %t2755 = load i64, ptr %local.a23.2384
  %t2756 = load i64, ptr %local.a30.2385
  %t2757 = load i64, ptr %local.a31.2386
  %t2758 = load i64, ptr %local.a32.2387
  %t2759 = load i64, ptr %local.inner_steps.2369
  %t2760 = call i64 @"meta_grad"(i64 %t2747, i64 %t2748, i64 %t2749, i64 %t2750, i64 %t2751, i64 %t2752, i64 %t2753, i64 %t2754, i64 %t2755, i64 %t2756, i64 %t2757, i64 %t2758, i64 8, i64 %t2759)
  store i64 %t2760, ptr %local.mg.2397
  %t2761 = load i64, ptr %local.a23.2384
  %t2762 = load i64, ptr %local.meta_lr.2371
  %t2763 = load i64, ptr %local.mg.2397
  %t2764 = call i64 @"sx_f64_mul"(i64 %t2762, i64 %t2763)
  %t2765 = call i64 @"sx_f64_sub"(i64 %t2761, i64 %t2764)
  %t2766 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.249)
  %t2767 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.250)
  %t2768 = call i64 @"clamp"(i64 %t2765, i64 %t2766, i64 %t2767)
  store i64 %t2768, ptr %local.a23.2384
  %t2769 = load i64, ptr %local.a01.2376
  %t2770 = load i64, ptr %local.a02.2377
  %t2771 = load i64, ptr %local.a03.2378
  %t2772 = load i64, ptr %local.a10.2379
  %t2773 = load i64, ptr %local.a12.2380
  %t2774 = load i64, ptr %local.a13.2381
  %t2775 = load i64, ptr %local.a20.2382
  %t2776 = load i64, ptr %local.a21.2383
  %t2777 = load i64, ptr %local.a23.2384
  %t2778 = load i64, ptr %local.a30.2385
  %t2779 = load i64, ptr %local.a31.2386
  %t2780 = load i64, ptr %local.a32.2387
  %t2781 = load i64, ptr %local.inner_steps.2369
  %t2782 = call i64 @"meta_grad"(i64 %t2769, i64 %t2770, i64 %t2771, i64 %t2772, i64 %t2773, i64 %t2774, i64 %t2775, i64 %t2776, i64 %t2777, i64 %t2778, i64 %t2779, i64 %t2780, i64 9, i64 %t2781)
  store i64 %t2782, ptr %local.mg.2397
  %t2783 = load i64, ptr %local.a30.2385
  %t2784 = load i64, ptr %local.meta_lr.2371
  %t2785 = load i64, ptr %local.mg.2397
  %t2786 = call i64 @"sx_f64_mul"(i64 %t2784, i64 %t2785)
  %t2787 = call i64 @"sx_f64_sub"(i64 %t2783, i64 %t2786)
  %t2788 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.251)
  %t2789 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.252)
  %t2790 = call i64 @"clamp"(i64 %t2787, i64 %t2788, i64 %t2789)
  store i64 %t2790, ptr %local.a30.2385
  %t2791 = load i64, ptr %local.a01.2376
  %t2792 = load i64, ptr %local.a02.2377
  %t2793 = load i64, ptr %local.a03.2378
  %t2794 = load i64, ptr %local.a10.2379
  %t2795 = load i64, ptr %local.a12.2380
  %t2796 = load i64, ptr %local.a13.2381
  %t2797 = load i64, ptr %local.a20.2382
  %t2798 = load i64, ptr %local.a21.2383
  %t2799 = load i64, ptr %local.a23.2384
  %t2800 = load i64, ptr %local.a30.2385
  %t2801 = load i64, ptr %local.a31.2386
  %t2802 = load i64, ptr %local.a32.2387
  %t2803 = load i64, ptr %local.inner_steps.2369
  %t2804 = call i64 @"meta_grad"(i64 %t2791, i64 %t2792, i64 %t2793, i64 %t2794, i64 %t2795, i64 %t2796, i64 %t2797, i64 %t2798, i64 %t2799, i64 %t2800, i64 %t2801, i64 %t2802, i64 10, i64 %t2803)
  store i64 %t2804, ptr %local.mg.2397
  %t2805 = load i64, ptr %local.a31.2386
  %t2806 = load i64, ptr %local.meta_lr.2371
  %t2807 = load i64, ptr %local.mg.2397
  %t2808 = call i64 @"sx_f64_mul"(i64 %t2806, i64 %t2807)
  %t2809 = call i64 @"sx_f64_sub"(i64 %t2805, i64 %t2808)
  %t2810 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.253)
  %t2811 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.254)
  %t2812 = call i64 @"clamp"(i64 %t2809, i64 %t2810, i64 %t2811)
  store i64 %t2812, ptr %local.a31.2386
  %t2813 = load i64, ptr %local.a01.2376
  %t2814 = load i64, ptr %local.a02.2377
  %t2815 = load i64, ptr %local.a03.2378
  %t2816 = load i64, ptr %local.a10.2379
  %t2817 = load i64, ptr %local.a12.2380
  %t2818 = load i64, ptr %local.a13.2381
  %t2819 = load i64, ptr %local.a20.2382
  %t2820 = load i64, ptr %local.a21.2383
  %t2821 = load i64, ptr %local.a23.2384
  %t2822 = load i64, ptr %local.a30.2385
  %t2823 = load i64, ptr %local.a31.2386
  %t2824 = load i64, ptr %local.a32.2387
  %t2825 = load i64, ptr %local.inner_steps.2369
  %t2826 = call i64 @"meta_grad"(i64 %t2813, i64 %t2814, i64 %t2815, i64 %t2816, i64 %t2817, i64 %t2818, i64 %t2819, i64 %t2820, i64 %t2821, i64 %t2822, i64 %t2823, i64 %t2824, i64 11, i64 %t2825)
  store i64 %t2826, ptr %local.mg.2397
  %t2827 = load i64, ptr %local.a32.2387
  %t2828 = load i64, ptr %local.meta_lr.2371
  %t2829 = load i64, ptr %local.mg.2397
  %t2830 = call i64 @"sx_f64_mul"(i64 %t2828, i64 %t2829)
  %t2831 = call i64 @"sx_f64_sub"(i64 %t2827, i64 %t2830)
  %t2832 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.255)
  %t2833 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.256)
  %t2834 = call i64 @"clamp"(i64 %t2831, i64 %t2832, i64 %t2833)
  store i64 %t2834, ptr %local.a32.2387
  %t2835 = load i64, ptr %local.a01.2376
  %t2836 = load i64, ptr %local.a02.2377
  %t2837 = load i64, ptr %local.a03.2378
  %t2838 = load i64, ptr %local.a10.2379
  %t2839 = load i64, ptr %local.a12.2380
  %t2840 = load i64, ptr %local.a13.2381
  %t2841 = load i64, ptr %local.a20.2382
  %t2842 = load i64, ptr %local.a21.2383
  %t2843 = load i64, ptr %local.a23.2384
  %t2844 = load i64, ptr %local.a30.2385
  %t2845 = load i64, ptr %local.a31.2386
  %t2846 = load i64, ptr %local.a32.2387
  %t2847 = load i64, ptr %local.inner_steps.2369
  %t2848 = call i64 @"run_inner"(i64 %t2835, i64 %t2836, i64 %t2837, i64 %t2838, i64 %t2839, i64 %t2840, i64 %t2841, i64 %t2842, i64 %t2843, i64 %t2844, i64 %t2845, i64 %t2846, i64 %t2847)
  store i64 %t2848, ptr %local.loss.2395
  %t2849 = load i64, ptr %local.a01.2376
  %t2850 = load i64, ptr %local.a02.2377
  %t2851 = load i64, ptr %local.a03.2378
  %t2852 = load i64, ptr %local.a10.2379
  %t2853 = load i64, ptr %local.a12.2380
  %t2854 = load i64, ptr %local.a13.2381
  %t2855 = load i64, ptr %local.a20.2382
  %t2856 = load i64, ptr %local.a21.2383
  %t2857 = load i64, ptr %local.a23.2384
  %t2858 = load i64, ptr %local.a30.2385
  %t2859 = load i64, ptr %local.a31.2386
  %t2860 = load i64, ptr %local.a32.2387
  %t2861 = load i64, ptr %local.inner_steps.2369
  %t2862 = call i64 @"run_inner_lyapunov"(i64 %t2849, i64 %t2850, i64 %t2851, i64 %t2852, i64 %t2853, i64 %t2854, i64 %t2855, i64 %t2856, i64 %t2857, i64 %t2858, i64 %t2859, i64 %t2860, i64 %t2861)
  store i64 %t2862, ptr %local.lyap.2396
  %t2863 = load i64, ptr %local.prev_drift.2388
  store i64 %t2863, ptr %local.prev_prev_drift.2389
  %t2864 = load i64, ptr %local.drift.2390
  store i64 %t2864, ptr %local.prev_drift.2388
  %t2865 = load i64, ptr %local.a01.2376
  %t2866 = load i64, ptr %local.pa01.2398
  %t2867 = call i64 @"sx_f64_sub"(i64 %t2865, i64 %t2866)
  %t2868 = call i64 @"abs_f64"(i64 %t2867)
  %t2869 = load i64, ptr %local.a02.2377
  %t2870 = load i64, ptr %local.pa02.2399
  %t2871 = call i64 @"sx_f64_sub"(i64 %t2869, i64 %t2870)
  %t2872 = call i64 @"abs_f64"(i64 %t2871)
  %t2873 = call i64 @"sx_f64_add"(i64 %t2868, i64 %t2872)
  %t2874 = load i64, ptr %local.a03.2378
  %t2875 = load i64, ptr %local.pa03.2400
  %t2876 = call i64 @"sx_f64_sub"(i64 %t2874, i64 %t2875)
  %t2877 = call i64 @"abs_f64"(i64 %t2876)
  %t2878 = call i64 @"sx_f64_add"(i64 %t2873, i64 %t2877)
  %t2879 = load i64, ptr %local.a10.2379
  %t2880 = load i64, ptr %local.pa10.2401
  %t2881 = call i64 @"sx_f64_sub"(i64 %t2879, i64 %t2880)
  %t2882 = call i64 @"abs_f64"(i64 %t2881)
  %t2883 = call i64 @"sx_f64_add"(i64 %t2878, i64 %t2882)
  %t2884 = load i64, ptr %local.a12.2380
  %t2885 = load i64, ptr %local.pa12.2402
  %t2886 = call i64 @"sx_f64_sub"(i64 %t2884, i64 %t2885)
  %t2887 = call i64 @"abs_f64"(i64 %t2886)
  %t2888 = call i64 @"sx_f64_add"(i64 %t2883, i64 %t2887)
  %t2889 = load i64, ptr %local.a13.2381
  %t2890 = load i64, ptr %local.pa13.2403
  %t2891 = call i64 @"sx_f64_sub"(i64 %t2889, i64 %t2890)
  %t2892 = call i64 @"abs_f64"(i64 %t2891)
  %t2893 = call i64 @"sx_f64_add"(i64 %t2888, i64 %t2892)
  %t2894 = load i64, ptr %local.a20.2382
  %t2895 = load i64, ptr %local.pa20.2404
  %t2896 = call i64 @"sx_f64_sub"(i64 %t2894, i64 %t2895)
  %t2897 = call i64 @"abs_f64"(i64 %t2896)
  %t2898 = call i64 @"sx_f64_add"(i64 %t2893, i64 %t2897)
  %t2899 = load i64, ptr %local.a21.2383
  %t2900 = load i64, ptr %local.pa21.2405
  %t2901 = call i64 @"sx_f64_sub"(i64 %t2899, i64 %t2900)
  %t2902 = call i64 @"abs_f64"(i64 %t2901)
  %t2903 = call i64 @"sx_f64_add"(i64 %t2898, i64 %t2902)
  %t2904 = load i64, ptr %local.a23.2384
  %t2905 = load i64, ptr %local.pa23.2406
  %t2906 = call i64 @"sx_f64_sub"(i64 %t2904, i64 %t2905)
  %t2907 = call i64 @"abs_f64"(i64 %t2906)
  %t2908 = call i64 @"sx_f64_add"(i64 %t2903, i64 %t2907)
  %t2909 = load i64, ptr %local.a30.2385
  %t2910 = load i64, ptr %local.pa30.2407
  %t2911 = call i64 @"sx_f64_sub"(i64 %t2909, i64 %t2910)
  %t2912 = call i64 @"abs_f64"(i64 %t2911)
  %t2913 = call i64 @"sx_f64_add"(i64 %t2908, i64 %t2912)
  %t2914 = load i64, ptr %local.a31.2386
  %t2915 = load i64, ptr %local.pa31.2408
  %t2916 = call i64 @"sx_f64_sub"(i64 %t2914, i64 %t2915)
  %t2917 = call i64 @"abs_f64"(i64 %t2916)
  %t2918 = call i64 @"sx_f64_add"(i64 %t2913, i64 %t2917)
  %t2919 = load i64, ptr %local.a32.2387
  %t2920 = load i64, ptr %local.pa32.2409
  %t2921 = call i64 @"sx_f64_sub"(i64 %t2919, i64 %t2920)
  %t2922 = call i64 @"abs_f64"(i64 %t2921)
  %t2923 = call i64 @"sx_f64_add"(i64 %t2918, i64 %t2922)
  store i64 %t2923, ptr %local.drift.2390
  %t2924 = load i64, ptr %local.drift.2390
  %t2925 = load i64, ptr %local.prev_drift.2388
  %t2926 = call i64 @"sx_f64_sub"(i64 %t2924, i64 %t2925)
  store i64 %t2926, ptr %local.d_prime.2391
  %t2927 = load i64, ptr %local.d_prime.2391
  %t2928 = load i64, ptr %local.prev_drift.2388
  %t2929 = load i64, ptr %local.prev_prev_drift.2389
  %t2930 = call i64 @"sx_f64_sub"(i64 %t2928, i64 %t2929)
  %t2931 = call i64 @"sx_f64_sub"(i64 %t2927, i64 %t2930)
  store i64 %t2931, ptr %local.d_double.2392
  %t2932 = load i64, ptr %local.drift.2390
  %t2933 = load i64, ptr %local.d_prime.2391
  %t2934 = call i64 @"abs_f64"(i64 %t2933)
  %t2935 = call i64 @"sx_f64_add"(i64 %t2932, i64 %t2934)
  %t2936 = load i64, ptr %local.d_double.2392
  %t2937 = call i64 @"abs_f64"(i64 %t2936)
  %t2938 = call i64 @"sx_f64_add"(i64 %t2935, i64 %t2937)
  store i64 %t2938, ptr %local.score.2393
  %t2939 = load i64, ptr %local.cycle.2394
  %t2940 = call i64 @"is_step_multiple"(i64 %t2939, i64 10)
  %t2941 = icmp eq i64 %t2940, 1
  %t2942 = zext i1 %t2941 to i64
  %t2943 = icmp ne i64 %t2942, 0
  br i1 %t2943, label %then54, label %else54
then54:
  %t2944 = load i64, ptr %local.cycle.2394
  %t2945 = load i64, ptr %local.loss.2395
  %t2946 = load i64, ptr %local.lyap.2396
  %t2947 = load i64, ptr %local.drift.2390
  %t2948 = load i64, ptr %local.score.2393
  %t2949 = call i64 @"print_cycle"(i64 %t2944, i64 %t2945, i64 %t2946, i64 %t2947, i64 %t2948)
  store i64 %t2949, ptr %local.r.2410
  br label %then54_end
then54_end:
  br label %endif54
else54:
  br label %else54_end
else54_end:
  br label %endif54
endif54:
  %t2950 = phi i64 [ 0, %then54_end ], [ 0, %else54_end ]
  %t2951 = load i64, ptr %local.cycle.2394
  %t2952 = load i64, ptr %local.meta_cycles.2370
  %t2953 = sub i64 %t2952, 1
  %t2954 = icmp eq i64 %t2951, %t2953
  %t2955 = zext i1 %t2954 to i64
  %t2956 = icmp ne i64 %t2955, 0
  br i1 %t2956, label %then55, label %else55
then55:
  %t2957 = load i64, ptr %local.cycle.2394
  %t2958 = load i64, ptr %local.loss.2395
  %t2959 = load i64, ptr %local.lyap.2396
  %t2960 = load i64, ptr %local.drift.2390
  %t2961 = load i64, ptr %local.score.2393
  %t2962 = call i64 @"print_cycle"(i64 %t2957, i64 %t2958, i64 %t2959, i64 %t2960, i64 %t2961)
  store i64 %t2962, ptr %local.r.2410
  br label %then55_end
then55_end:
  br label %endif55
else55:
  br label %else55_end
else55_end:
  br label %endif55
endif55:
  %t2963 = phi i64 [ 0, %then55_end ], [ 0, %else55_end ]
  %t2964 = load i64, ptr %local.cycle.2394
  %t2965 = add i64 %t2964, 1
  store i64 %t2965, ptr %local.cycle.2394
  br label %loop53
endloop53:
  %t2966 = load i64, ptr %local.a01.2376
  %t2967 = load i64, ptr %local.a02.2377
  %t2968 = load i64, ptr %local.a03.2378
  %t2969 = load i64, ptr %local.a10.2379
  %t2970 = load i64, ptr %local.a12.2380
  %t2971 = load i64, ptr %local.a13.2381
  %t2972 = load i64, ptr %local.a20.2382
  %t2973 = load i64, ptr %local.a21.2383
  %t2974 = load i64, ptr %local.a23.2384
  %t2975 = load i64, ptr %local.a30.2385
  %t2976 = load i64, ptr %local.a31.2386
  %t2977 = load i64, ptr %local.a32.2387
  %t2978 = load i64, ptr %local.inner_steps.2369
  %t2979 = call i64 @"run_inner"(i64 %t2966, i64 %t2967, i64 %t2968, i64 %t2969, i64 %t2970, i64 %t2971, i64 %t2972, i64 %t2973, i64 %t2974, i64 %t2975, i64 %t2976, i64 %t2977, i64 %t2978)
  store i64 %t2979, ptr %local.final_loss.2411
  %t2980 = load i64, ptr %local.a01.2376
  %t2981 = load i64, ptr %local.a02.2377
  %t2982 = load i64, ptr %local.a03.2378
  %t2983 = load i64, ptr %local.a10.2379
  %t2984 = load i64, ptr %local.a12.2380
  %t2985 = load i64, ptr %local.a13.2381
  %t2986 = load i64, ptr %local.a20.2382
  %t2987 = load i64, ptr %local.a21.2383
  %t2988 = load i64, ptr %local.a23.2384
  %t2989 = load i64, ptr %local.a30.2385
  %t2990 = load i64, ptr %local.a31.2386
  %t2991 = load i64, ptr %local.a32.2387
  %t2992 = load i64, ptr %local.inner_steps.2369
  %t2993 = call i64 @"run_inner_lyapunov"(i64 %t2980, i64 %t2981, i64 %t2982, i64 %t2983, i64 %t2984, i64 %t2985, i64 %t2986, i64 %t2987, i64 %t2988, i64 %t2989, i64 %t2990, i64 %t2991, i64 %t2992)
  store i64 %t2993, ptr %local.final_lyap.2412
  %t2994 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.257)
  %t2995 = ptrtoint ptr %t2994 to i64
  %t2996 = inttoptr i64 %t2995 to ptr
  call void @intrinsic_println(ptr %t2996)
  %t2997 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.258)
  %t2998 = ptrtoint ptr %t2997 to i64
  %t2999 = inttoptr i64 %t2998 to ptr
  call void @intrinsic_println(ptr %t2999)
  %t3000 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.259)
  %t3001 = ptrtoint ptr %t3000 to i64
  %t3002 = inttoptr i64 %t3001 to ptr
  call void @intrinsic_println(ptr %t3002)
  %t3003 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.260)
  %t3004 = ptrtoint ptr %t3003 to i64
  %t3005 = inttoptr i64 %t3004 to ptr
  call void @intrinsic_println(ptr %t3005)
  %t3006 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.261)
  %t3007 = ptrtoint ptr %t3006 to i64
  %t3008 = inttoptr i64 %t3007 to ptr
  call void @intrinsic_println(ptr %t3008)
  %t3009 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.262)
  %t3010 = ptrtoint ptr %t3009 to i64
  %t3011 = inttoptr i64 %t3010 to ptr
  call void @intrinsic_print(ptr %t3011)
  %t3012 = load i64, ptr %local.a01.2376
  %t3013 = call i64 @"print_f64"(i64 %t3012)
  %t3014 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.263)
  %t3015 = ptrtoint ptr %t3014 to i64
  %t3016 = inttoptr i64 %t3015 to ptr
  call void @intrinsic_print(ptr %t3016)
  %t3017 = load i64, ptr %local.a02.2377
  %t3018 = call i64 @"print_f64"(i64 %t3017)
  %t3019 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.264)
  %t3020 = ptrtoint ptr %t3019 to i64
  %t3021 = inttoptr i64 %t3020 to ptr
  call void @intrinsic_print(ptr %t3021)
  %t3022 = load i64, ptr %local.a03.2378
  %t3023 = call i64 @"print_f64"(i64 %t3022)
  %t3024 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.265)
  %t3025 = ptrtoint ptr %t3024 to i64
  %t3026 = inttoptr i64 %t3025 to ptr
  call void @intrinsic_println(ptr %t3026)
  %t3027 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.266)
  %t3028 = ptrtoint ptr %t3027 to i64
  %t3029 = inttoptr i64 %t3028 to ptr
  call void @intrinsic_print(ptr %t3029)
  %t3030 = load i64, ptr %local.a10.2379
  %t3031 = call i64 @"print_f64"(i64 %t3030)
  %t3032 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.267)
  %t3033 = ptrtoint ptr %t3032 to i64
  %t3034 = inttoptr i64 %t3033 to ptr
  call void @intrinsic_print(ptr %t3034)
  %t3035 = load i64, ptr %local.a12.2380
  %t3036 = call i64 @"print_f64"(i64 %t3035)
  %t3037 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.268)
  %t3038 = ptrtoint ptr %t3037 to i64
  %t3039 = inttoptr i64 %t3038 to ptr
  call void @intrinsic_print(ptr %t3039)
  %t3040 = load i64, ptr %local.a13.2381
  %t3041 = call i64 @"print_f64"(i64 %t3040)
  %t3042 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.269)
  %t3043 = ptrtoint ptr %t3042 to i64
  %t3044 = inttoptr i64 %t3043 to ptr
  call void @intrinsic_println(ptr %t3044)
  %t3045 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.270)
  %t3046 = ptrtoint ptr %t3045 to i64
  %t3047 = inttoptr i64 %t3046 to ptr
  call void @intrinsic_print(ptr %t3047)
  %t3048 = load i64, ptr %local.a20.2382
  %t3049 = call i64 @"print_f64"(i64 %t3048)
  %t3050 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.271)
  %t3051 = ptrtoint ptr %t3050 to i64
  %t3052 = inttoptr i64 %t3051 to ptr
  call void @intrinsic_print(ptr %t3052)
  %t3053 = load i64, ptr %local.a21.2383
  %t3054 = call i64 @"print_f64"(i64 %t3053)
  %t3055 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.272)
  %t3056 = ptrtoint ptr %t3055 to i64
  %t3057 = inttoptr i64 %t3056 to ptr
  call void @intrinsic_print(ptr %t3057)
  %t3058 = load i64, ptr %local.a23.2384
  %t3059 = call i64 @"print_f64"(i64 %t3058)
  %t3060 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.273)
  %t3061 = ptrtoint ptr %t3060 to i64
  %t3062 = inttoptr i64 %t3061 to ptr
  call void @intrinsic_println(ptr %t3062)
  %t3063 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.274)
  %t3064 = ptrtoint ptr %t3063 to i64
  %t3065 = inttoptr i64 %t3064 to ptr
  call void @intrinsic_print(ptr %t3065)
  %t3066 = load i64, ptr %local.a30.2385
  %t3067 = call i64 @"print_f64"(i64 %t3066)
  %t3068 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.275)
  %t3069 = ptrtoint ptr %t3068 to i64
  %t3070 = inttoptr i64 %t3069 to ptr
  call void @intrinsic_print(ptr %t3070)
  %t3071 = load i64, ptr %local.a31.2386
  %t3072 = call i64 @"print_f64"(i64 %t3071)
  %t3073 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.276)
  %t3074 = ptrtoint ptr %t3073 to i64
  %t3075 = inttoptr i64 %t3074 to ptr
  call void @intrinsic_print(ptr %t3075)
  %t3076 = load i64, ptr %local.a32.2387
  %t3077 = call i64 @"print_f64"(i64 %t3076)
  %t3078 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.277)
  %t3079 = ptrtoint ptr %t3078 to i64
  %t3080 = inttoptr i64 %t3079 to ptr
  call void @intrinsic_print(ptr %t3080)
  %t3081 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.278)
  %t3082 = ptrtoint ptr %t3081 to i64
  %t3083 = inttoptr i64 %t3082 to ptr
  call void @intrinsic_println(ptr %t3083)
  %t3084 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.279)
  %t3085 = ptrtoint ptr %t3084 to i64
  %t3086 = inttoptr i64 %t3085 to ptr
  call void @intrinsic_println(ptr %t3086)
  %t3087 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.280)
  %t3088 = ptrtoint ptr %t3087 to i64
  %t3089 = inttoptr i64 %t3088 to ptr
  call void @intrinsic_println(ptr %t3089)
  %t3090 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.281)
  %t3091 = ptrtoint ptr %t3090 to i64
  %t3092 = inttoptr i64 %t3091 to ptr
  call void @intrinsic_println(ptr %t3092)
  %t3093 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.282)
  %t3094 = ptrtoint ptr %t3093 to i64
  %t3095 = inttoptr i64 %t3094 to ptr
  call void @intrinsic_println(ptr %t3095)
  %t3096 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.283)
  %t3097 = ptrtoint ptr %t3096 to i64
  %t3098 = inttoptr i64 %t3097 to ptr
  call void @intrinsic_print(ptr %t3098)
  %t3099 = load i64, ptr %local.loss_base.2372
  %t3100 = call i64 @"print_f64"(i64 %t3099)
  %t3101 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.284)
  %t3102 = ptrtoint ptr %t3101 to i64
  %t3103 = inttoptr i64 %t3102 to ptr
  call void @intrinsic_print(ptr %t3103)
  %t3104 = load i64, ptr %local.lyap_base.2373
  %t3105 = call i64 @"print_f64"(i64 %t3104)
  %t3106 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.285)
  %t3107 = ptrtoint ptr %t3106 to i64
  %t3108 = inttoptr i64 %t3107 to ptr
  call void @intrinsic_println(ptr %t3108)
  %t3109 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.286)
  %t3110 = ptrtoint ptr %t3109 to i64
  %t3111 = inttoptr i64 %t3110 to ptr
  call void @intrinsic_print(ptr %t3111)
  %t3112 = load i64, ptr %local.loss_unif.2374
  %t3113 = call i64 @"print_f64"(i64 %t3112)
  %t3114 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.287)
  %t3115 = ptrtoint ptr %t3114 to i64
  %t3116 = inttoptr i64 %t3115 to ptr
  call void @intrinsic_print(ptr %t3116)
  %t3117 = load i64, ptr %local.lyap_unif.2375
  %t3118 = call i64 @"print_f64"(i64 %t3117)
  %t3119 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.288)
  %t3120 = ptrtoint ptr %t3119 to i64
  %t3121 = inttoptr i64 %t3120 to ptr
  call void @intrinsic_println(ptr %t3121)
  %t3122 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.289)
  %t3123 = ptrtoint ptr %t3122 to i64
  %t3124 = inttoptr i64 %t3123 to ptr
  call void @intrinsic_print(ptr %t3124)
  %t3125 = load i64, ptr %local.final_loss.2411
  %t3126 = call i64 @"print_f64"(i64 %t3125)
  %t3127 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.290)
  %t3128 = ptrtoint ptr %t3127 to i64
  %t3129 = inttoptr i64 %t3128 to ptr
  call void @intrinsic_print(ptr %t3129)
  %t3130 = load i64, ptr %local.final_lyap.2412
  %t3131 = call i64 @"print_f64"(i64 %t3130)
  %t3132 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.291)
  %t3133 = ptrtoint ptr %t3132 to i64
  %t3134 = inttoptr i64 %t3133 to ptr
  call void @intrinsic_println(ptr %t3134)
  %t3135 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.292)
  %t3136 = ptrtoint ptr %t3135 to i64
  %t3137 = inttoptr i64 %t3136 to ptr
  call void @intrinsic_println(ptr %t3137)
  %t3138 = load i64, ptr %local.final_lyap.2412
  %t3139 = load i64, ptr %local.lyap_base.2373
  %t3140 = call i64 @"sx_f64_lt"(i64 %t3138, i64 %t3139)
  %t3141 = icmp ne i64 %t3140, 0
  br i1 %t3141, label %then56, label %else56
then56:
  %t3142 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.293)
  %t3143 = ptrtoint ptr %t3142 to i64
  %t3144 = inttoptr i64 %t3143 to ptr
  call void @intrinsic_println(ptr %t3144)
  br label %then56_end
then56_end:
  br label %endif56
else56:
  %t3145 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.294)
  %t3146 = ptrtoint ptr %t3145 to i64
  %t3147 = inttoptr i64 %t3146 to ptr
  call void @intrinsic_println(ptr %t3147)
  br label %else56_end
else56_end:
  br label %endif56
endif56:
  %t3148 = phi i64 [ 0, %then56_end ], [ 0, %else56_end ]
  %t3149 = load i64, ptr %local.score.2393
  %t3150 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.295)
  %t3151 = call i64 @"sx_f64_lt"(i64 %t3149, i64 %t3150)
  %t3152 = icmp ne i64 %t3151, 0
  br i1 %t3152, label %then57, label %else57
then57:
  %t3153 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.296)
  %t3154 = ptrtoint ptr %t3153 to i64
  %t3155 = inttoptr i64 %t3154 to ptr
  call void @intrinsic_println(ptr %t3155)
  br label %then57_end
then57_end:
  br label %endif57
else57:
  %t3156 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.297)
  %t3157 = ptrtoint ptr %t3156 to i64
  %t3158 = inttoptr i64 %t3157 to ptr
  call void @intrinsic_print(ptr %t3158)
  %t3159 = load i64, ptr %local.score.2393
  %t3160 = call i64 @"print_f64"(i64 %t3159)
  %t3161 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.298)
  %t3162 = ptrtoint ptr %t3161 to i64
  %t3163 = inttoptr i64 %t3162 to ptr
  call void @intrinsic_println(ptr %t3163)
  br label %else57_end
else57_end:
  br label %endif57
endif57:
  %t3164 = phi i64 [ 0, %then57_end ], [ 0, %else57_end ]
  %t3165 = load i64, ptr %local.final_loss.2411
  %t3166 = load i64, ptr %local.loss_base.2372
  %t3167 = call i64 @"sx_f64_lt"(i64 %t3165, i64 %t3166)
  %t3168 = icmp ne i64 %t3167, 0
  br i1 %t3168, label %then58, label %else58
then58:
  %t3169 = load i64, ptr %local.final_loss.2411
  %t3170 = load i64, ptr %local.loss_unif.2374
  %t3171 = call i64 @"sx_f64_lt"(i64 %t3169, i64 %t3170)
  %t3172 = icmp ne i64 %t3171, 0
  br i1 %t3172, label %then59, label %else59
then59:
  %t3173 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.299)
  %t3174 = ptrtoint ptr %t3173 to i64
  %t3175 = inttoptr i64 %t3174 to ptr
  call void @intrinsic_println(ptr %t3175)
  br label %then59_end
then59_end:
  br label %endif59
else59:
  %t3176 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.300)
  %t3177 = ptrtoint ptr %t3176 to i64
  %t3178 = inttoptr i64 %t3177 to ptr
  call void @intrinsic_println(ptr %t3178)
  br label %else59_end
else59_end:
  br label %endif59
endif59:
  %t3179 = phi i64 [ 0, %then59_end ], [ 0, %else59_end ]
  br label %then58_end
then58_end:
  br label %endif58
else58:
  %t3180 = load i64, ptr %local.final_loss.2411
  %t3181 = load i64, ptr %local.loss_base.2372
  %t3182 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.301)
  %t3183 = call i64 @"sx_f64_add"(i64 %t3181, i64 %t3182)
  %t3184 = call i64 @"sx_f64_le"(i64 %t3180, i64 %t3183)
  %t3185 = icmp ne i64 %t3184, 0
  br i1 %t3185, label %then60, label %else60
then60:
  %t3186 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.302)
  %t3187 = ptrtoint ptr %t3186 to i64
  %t3188 = inttoptr i64 %t3187 to ptr
  call void @intrinsic_println(ptr %t3188)
  br label %then60_end
then60_end:
  br label %endif60
else60:
  %t3189 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.303)
  %t3190 = ptrtoint ptr %t3189 to i64
  %t3191 = inttoptr i64 %t3190 to ptr
  call void @intrinsic_println(ptr %t3191)
  br label %else60_end
else60_end:
  br label %endif60
endif60:
  %t3192 = phi i64 [ 0, %then60_end ], [ 0, %else60_end ]
  br label %else58_end
else58_end:
  br label %endif58
endif58:
  %t3193 = phi i64 [ %t3179, %then58_end ], [ %t3192, %else58_end ]
  %t3194 = load i64, ptr %local.drift.2390
  %t3195 = call i64 @f64_parse(ptr @.str.exp_liquid_hive.304)
  %t3196 = call i64 @"sx_f64_lt"(i64 %t3194, i64 %t3195)
  %t3197 = icmp ne i64 %t3196, 0
  br i1 %t3197, label %then61, label %else61
then61:
  %t3198 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.305)
  %t3199 = ptrtoint ptr %t3198 to i64
  %t3200 = inttoptr i64 %t3199 to ptr
  call void @intrinsic_println(ptr %t3200)
  br label %then61_end
then61_end:
  br label %endif61
else61:
  %t3201 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.306)
  %t3202 = ptrtoint ptr %t3201 to i64
  %t3203 = inttoptr i64 %t3202 to ptr
  call void @intrinsic_print(ptr %t3203)
  %t3204 = load i64, ptr %local.drift.2390
  %t3205 = call i64 @"print_f64"(i64 %t3204)
  %t3206 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.307)
  %t3207 = ptrtoint ptr %t3206 to i64
  %t3208 = inttoptr i64 %t3207 to ptr
  call void @intrinsic_println(ptr %t3208)
  br label %else61_end
else61_end:
  br label %endif61
endif61:
  %t3209 = phi i64 [ 0, %then61_end ], [ 0, %else61_end ]
  %t3210 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.308)
  %t3211 = ptrtoint ptr %t3210 to i64
  %t3212 = inttoptr i64 %t3211 to ptr
  call void @intrinsic_println(ptr %t3212)
  %t3213 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.309)
  %t3214 = ptrtoint ptr %t3213 to i64
  %t3215 = inttoptr i64 %t3214 to ptr
  call void @intrinsic_println(ptr %t3215)
  %t3216 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.310)
  %t3217 = ptrtoint ptr %t3216 to i64
  %t3218 = inttoptr i64 %t3217 to ptr
  call void @intrinsic_println(ptr %t3218)
  %t3219 = call ptr @intrinsic_string_new(ptr @.str.exp_liquid_hive.311)
  %t3220 = ptrtoint ptr %t3219 to i64
  %t3221 = inttoptr i64 %t3220 to ptr
  call void @intrinsic_println(ptr %t3221)
  ret i64 0
}


; String constants
@.str.exp_liquid_hive.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.2 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_liquid_hive.3 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_liquid_hive.4 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_liquid_hive.5 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.6 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.7 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_liquid_hive.8 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_liquid_hive.9 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_liquid_hive.10 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_liquid_hive.11 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.12 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.13 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_liquid_hive.14 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_liquid_hive.15 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_liquid_hive.16 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_liquid_hive.17 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_liquid_hive.18 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_liquid_hive.19 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_liquid_hive.20 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_liquid_hive.21 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.22 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.23 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.24 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.25 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.26 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.27 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_liquid_hive.28 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_liquid_hive.29 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_liquid_hive.30 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.31 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_liquid_hive.32 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_liquid_hive.33 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_liquid_hive.34 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_liquid_hive.35 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_liquid_hive.36 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.37 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_liquid_hive.38 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_liquid_hive.39 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_liquid_hive.40 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_liquid_hive.41 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_liquid_hive.42 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_liquid_hive.43 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_liquid_hive.44 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_liquid_hive.45 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_liquid_hive.46 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_liquid_hive.47 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.48 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_liquid_hive.49 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.50 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_liquid_hive.51 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.52 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.53 = private unnamed_addr constant [15 x i8] c"0.000000000001\00"
@.str.exp_liquid_hive.54 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.55 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.56 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.57 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.58 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_liquid_hive.59 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_liquid_hive.60 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.61 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_liquid_hive.62 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_liquid_hive.63 = private unnamed_addr constant [5 x i8] c"0.02\00"
@.str.exp_liquid_hive.64 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.65 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.66 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_liquid_hive.67 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.68 = private unnamed_addr constant [5 x i8] c"0.15\00"
@.str.exp_liquid_hive.69 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.70 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.71 = private unnamed_addr constant [5 x i8] c"0.03\00"
@.str.exp_liquid_hive.72 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_liquid_hive.73 = private unnamed_addr constant [4 x i8] c"1.1\00"
@.str.exp_liquid_hive.74 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_liquid_hive.75 = private unnamed_addr constant [5 x i8] c"0.15\00"
@.str.exp_liquid_hive.76 = private unnamed_addr constant [4 x i8] c"0.9\00"
@.str.exp_liquid_hive.77 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_liquid_hive.78 = private unnamed_addr constant [5 x i8] c"0.15\00"
@.str.exp_liquid_hive.79 = private unnamed_addr constant [5 x i8] c"30.0\00"
@.str.exp_liquid_hive.80 = private unnamed_addr constant [5 x i8] c"23.0\00"
@.str.exp_liquid_hive.81 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_liquid_hive.82 = private unnamed_addr constant [4 x i8] c"7.0\00"
@.str.exp_liquid_hive.83 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.84 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.85 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.86 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.87 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.88 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_liquid_hive.89 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_liquid_hive.90 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.91 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.92 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_liquid_hive.93 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_liquid_hive.94 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_liquid_hive.95 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_liquid_hive.96 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_liquid_hive.97 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_liquid_hive.98 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_liquid_hive.99 = private unnamed_addr constant [6 x i8] c"0.005\00"
@.str.exp_liquid_hive.100 = private unnamed_addr constant [5 x i8] c"0.02\00"
@.str.exp_liquid_hive.101 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.102 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.103 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_liquid_hive.104 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.105 = private unnamed_addr constant [5 x i8] c"0.15\00"
@.str.exp_liquid_hive.106 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.107 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.108 = private unnamed_addr constant [5 x i8] c"0.03\00"
@.str.exp_liquid_hive.109 = private unnamed_addr constant [5 x i8] c"0.03\00"
@.str.exp_liquid_hive.110 = private unnamed_addr constant [5 x i8] c"0.03\00"
@.str.exp_liquid_hive.111 = private unnamed_addr constant [5 x i8] c"0.03\00"
@.str.exp_liquid_hive.112 = private unnamed_addr constant [5 x i8] c"50.0\00"
@.str.exp_liquid_hive.113 = private unnamed_addr constant [4 x i8] c"1.1\00"
@.str.exp_liquid_hive.114 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_liquid_hive.115 = private unnamed_addr constant [5 x i8] c"0.15\00"
@.str.exp_liquid_hive.116 = private unnamed_addr constant [4 x i8] c"0.9\00"
@.str.exp_liquid_hive.117 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_liquid_hive.118 = private unnamed_addr constant [5 x i8] c"0.15\00"
@.str.exp_liquid_hive.119 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_liquid_hive.120 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_liquid_hive.121 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_liquid_hive.122 = private unnamed_addr constant [13 x i8] c"Liquid  ->  \00"
@.str.exp_liquid_hive.123 = private unnamed_addr constant [13 x i8] c"LoRA    ->  \00"
@.str.exp_liquid_hive.124 = private unnamed_addr constant [13 x i8] c"Beliefs ->  \00"
@.str.exp_liquid_hive.125 = private unnamed_addr constant [13 x i8] c"Memory  ->  \00"
@.str.exp_liquid_hive.126 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_liquid_hive.127 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_liquid_hive.128 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_liquid_hive.129 = private unnamed_addr constant [48 x i8] c"  Cycle  Loss       Lyapunov   Drift      Score\00"
@.str.exp_liquid_hive.130 = private unnamed_addr constant [52 x i8] c"  -----  ---------  ---------  ---------  ---------\00"
@.str.exp_liquid_hive.131 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_liquid_hive.132 = private unnamed_addr constant [7 x i8] c"      \00"
@.str.exp_liquid_hive.133 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_liquid_hive.134 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_liquid_hive.135 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_liquid_hive.136 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_liquid_hive.137 = private unnamed_addr constant [5 x i8] c"0.08\00"
@.str.exp_liquid_hive.138 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_liquid_hive.139 = private unnamed_addr constant [58 x i8] c"  GEOMETRIC CONTRACTION FRAMEWORK: LIQUID HIVE EXPERIMENT\00"
@.str.exp_liquid_hive.140 = private unnamed_addr constant [55 x i8] c"  5 subsystems (Liquid/LoRA/Beliefs/Memory/Meta) in 4D\00"
@.str.exp_liquid_hive.141 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_liquid_hive.142 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_liquid_hive.143 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.144 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.145 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.146 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.147 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.148 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.149 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.150 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.151 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.152 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.153 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.154 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.155 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.156 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.157 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.158 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.159 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.160 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.161 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.162 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.163 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.164 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.165 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.166 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.167 = private unnamed_addr constant [36 x i8] c"  Baseline (no projection):   loss=\00"
@.str.exp_liquid_hive.168 = private unnamed_addr constant [5 x i8] c"  V=\00"
@.str.exp_liquid_hive.169 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_liquid_hive.170 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.171 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.172 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.173 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.174 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.175 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.176 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.177 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.178 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.179 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.180 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.181 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.182 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.183 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.184 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.185 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.186 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.187 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.188 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.189 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.190 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.191 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.192 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.193 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.194 = private unnamed_addr constant [36 x i8] c"  Uniform  (all alpha=1):     loss=\00"
@.str.exp_liquid_hive.195 = private unnamed_addr constant [5 x i8] c"  V=\00"
@.str.exp_liquid_hive.196 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_liquid_hive.197 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_liquid_hive.198 = private unnamed_addr constant [52 x i8] c"--- Learning 4x4 interaction matrix (12 alphas) ---\00"
@.str.exp_liquid_hive.199 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_liquid_hive.200 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_liquid_hive.201 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_liquid_hive.202 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_liquid_hive.203 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_liquid_hive.204 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_liquid_hive.205 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_liquid_hive.206 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_liquid_hive.207 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_liquid_hive.208 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_liquid_hive.209 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_liquid_hive.210 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_liquid_hive.211 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_liquid_hive.212 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.213 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.214 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.215 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.216 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.217 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.218 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.219 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.220 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.221 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_liquid_hive.222 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_liquid_hive.223 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_liquid_hive.224 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_liquid_hive.225 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_liquid_hive.226 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_liquid_hive.227 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_liquid_hive.228 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_liquid_hive.229 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_liquid_hive.230 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_liquid_hive.231 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_liquid_hive.232 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_liquid_hive.233 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.234 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_liquid_hive.235 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.236 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_liquid_hive.237 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.238 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_liquid_hive.239 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.240 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_liquid_hive.241 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.242 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_liquid_hive.243 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.244 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_liquid_hive.245 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.246 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_liquid_hive.247 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.248 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_liquid_hive.249 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.250 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_liquid_hive.251 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.252 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_liquid_hive.253 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.254 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_liquid_hive.255 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_liquid_hive.256 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_liquid_hive.257 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_liquid_hive.258 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_liquid_hive.259 = private unnamed_addr constant [33 x i8] c"  LEARNED 4x4 INTERACTION MATRIX\00"
@.str.exp_liquid_hive.260 = private unnamed_addr constant [49 x i8] c"            Liquid    LoRA      Beliefs   Memory\00"
@.str.exp_liquid_hive.261 = private unnamed_addr constant [51 x i8] c"  --------  --------  --------  --------  --------\00"
@.str.exp_liquid_hive.262 = private unnamed_addr constant [23 x i8] c"  Liquid    ---       \00"
@.str.exp_liquid_hive.263 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_liquid_hive.264 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_liquid_hive.265 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_liquid_hive.266 = private unnamed_addr constant [13 x i8] c"  LoRA      \00"
@.str.exp_liquid_hive.267 = private unnamed_addr constant [13 x i8] c"  ---       \00"
@.str.exp_liquid_hive.268 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_liquid_hive.269 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_liquid_hive.270 = private unnamed_addr constant [13 x i8] c"  Beliefs   \00"
@.str.exp_liquid_hive.271 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_liquid_hive.272 = private unnamed_addr constant [13 x i8] c"  ---       \00"
@.str.exp_liquid_hive.273 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_liquid_hive.274 = private unnamed_addr constant [13 x i8] c"  Memory    \00"
@.str.exp_liquid_hive.275 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_liquid_hive.276 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_liquid_hive.277 = private unnamed_addr constant [6 x i8] c"  ---\00"
@.str.exp_liquid_hive.278 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_liquid_hive.279 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_liquid_hive.280 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_liquid_hive.281 = private unnamed_addr constant [13 x i8] c"  COMPARISON\00"
@.str.exp_liquid_hive.282 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_liquid_hive.283 = private unnamed_addr constant [30 x i8] c"  Baseline (no proj):   loss=\00"
@.str.exp_liquid_hive.284 = private unnamed_addr constant [5 x i8] c"  V=\00"
@.str.exp_liquid_hive.285 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_liquid_hive.286 = private unnamed_addr constant [30 x i8] c"  Uniform  (alpha=1):   loss=\00"
@.str.exp_liquid_hive.287 = private unnamed_addr constant [5 x i8] c"  V=\00"
@.str.exp_liquid_hive.288 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_liquid_hive.289 = private unnamed_addr constant [30 x i8] c"  Learned  matrix:      loss=\00"
@.str.exp_liquid_hive.290 = private unnamed_addr constant [5 x i8] c"  V=\00"
@.str.exp_liquid_hive.291 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_liquid_hive.292 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_liquid_hive.293 = private unnamed_addr constant [54 x i8] c"  PASS: Learned matrix reduces Lyapunov V vs baseline\00"
@.str.exp_liquid_hive.294 = private unnamed_addr constant [55 x i8] c"  NOTE: Learned matrix did not reduce V below baseline\00"
@.str.exp_liquid_hive.295 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_liquid_hive.296 = private unnamed_addr constant [60 x i8] c"  PASS: Higher-order convergence score S < 1.0 (stabilised)\00"
@.str.exp_liquid_hive.297 = private unnamed_addr constant [31 x i8] c"  NOTE: Convergence score S = \00"
@.str.exp_liquid_hive.298 = private unnamed_addr constant [20 x i8] c" (still converging)\00"
@.str.exp_liquid_hive.299 = private unnamed_addr constant [52 x i8] c"  PASS: Learned matrix BEATS both baselines on loss\00"
@.str.exp_liquid_hive.300 = private unnamed_addr constant [47 x i8] c"  PARTIAL: Beats no-projection but not uniform\00"
@.str.exp_liquid_hive.301 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_liquid_hive.302 = private unnamed_addr constant [57 x i8] c"  PASS: Learned matrix matches baseline (flat landscape)\00"
@.str.exp_liquid_hive.303 = private unnamed_addr constant [57 x i8] c"  FAIL: Learned matrix worse than no-projection baseline\00"
@.str.exp_liquid_hive.304 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_liquid_hive.305 = private unnamed_addr constant [46 x i8] c"  PASS: Matrix drift converged (drift < 0.05)\00"
@.str.exp_liquid_hive.306 = private unnamed_addr constant [38 x i8] c"  NOTE: Matrix still drifting (drift=\00"
@.str.exp_liquid_hive.307 = private unnamed_addr constant [2 x i8] c")\00"
@.str.exp_liquid_hive.308 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_liquid_hive.309 = private unnamed_addr constant [61 x i8] c"============================================================\00"
@.str.exp_liquid_hive.310 = private unnamed_addr constant [22 x i8] c"  EXPERIMENT COMPLETE\00"
@.str.exp_liquid_hive.311 = private unnamed_addr constant [61 x i8] c"============================================================\00"
